//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension Rocket.Support {

    /** When an account is created an email is sent to the email address of the new account.
This contains a link, which once clicked, verifies the email address of the account is correct.

The link contains a token as a query parameter which should be passed as the authorization
bearer token to this endpoint to complete email verification.

The token has en expiry, so if the link is not clicked before it expires, the account holder
may need to request a new verification email be sent. This can be done via the endpoint
/account/request-email-verification.
 */
    public enum VerifyEmail {

      public static let service = APIService<Response>(id: "verifyEmail", tag: "support", method: "POST", path: "/verify-email", hasBody: false, authorization: Authorization(type: "verifyEmailAuth", scope: ""))

      public class Request: APIRequest<Response> {

          public init() {
              super.init(service: VerifyEmail.service)
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** OK */
            case success204

            /** Bad request. */
            case failure400(ServiceError)

            /** Invalid access token. */
            case failure401(ServiceError)

            /** Forbidden. */
            case failure403(ServiceError)

            /** Not found. */
            case failure404(ServiceError)

            /** Internal server error. */
            case failure500(ServiceError)

            /** Service error. */
            case failureDefault(statusCode: Int, ServiceError)

            public var success: Void? {
                switch self {
                case .success204(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .failure400(let response): return response
                case .failure401(let response): return response
                case .failure403(let response): return response
                case .failure404(let response): return response
                case .failure500(let response): return response
                case .failureDefault(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<Void, ServiceError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .failure400(let response): return response
                case .failure401(let response): return response
                case .failure403(let response): return response
                case .failure404(let response): return response
                case .failure500(let response): return response
                case .failureDefault(_, let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
              switch self {
              case .success204: return 204
              case .failure400: return 400
              case .failure401: return 401
              case .failure403: return 403
              case .failure404: return 404
              case .failure500: return 500
              case .failureDefault(let statusCode, _): return statusCode
              }
            }

            public var successful: Bool {
              switch self {
              case .success204: return true
              case .failure400: return false
              case .failure401: return false
              case .failure403: return false
              case .failure404: return false
              case .failure500: return false
              case .failureDefault: return false
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 204: self = .success204
                case 400: self = try .failure400(JSONDecoder.decode(data: data))
                case 401: self = try .failure401(JSONDecoder.decode(data: data))
                case 403: self = try .failure403(JSONDecoder.decode(data: data))
                case 404: self = try .failure404(JSONDecoder.decode(data: data))
                case 500: self = try .failure500(JSONDecoder.decode(data: data))
                default: self = try .failureDefault(statusCode: statusCode, JSONDecoder.decode(data: data))
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}