require 'spec_helper'

describe 'WAVSEP XSS' do
    include_examples 'wavsep'

    def self.test_cases( http_method )
        {
            'Reflected Cross Site Scripting' => {
                url:        "RXSS-Detection-Evaluation-#{http_method}/",
                checks:    'xss*',

                # Misses a few because there's no VBScript support.
                vulnerable: [
                    'Case01-Tag2HtmlPageScope.jsp',
                    'Case02-Tag2TagScope.jsp',
                    'Case03-Tag2TagStructure.jsp',
                    'Case04-Tag2HtmlComment.jsp',
                    'Case05-Tag2Frameset.jsp',
                    'Case06-Event2TagScope.jsp',
                    'Case07-Event2DoubleQuotePropertyScope.jsp',
                    'Case08-Event2SingleQuotePropertyScope.jsp',
                    'Case09-SrcProperty2TagStructure.jsp',
                    'Case10-Js2DoubleQuoteJsEventScope.jsp',
                    'Case11-Js2SingleQuoteJsEventScope.jsp',
                    'Case12-Js2JsEventScope.jsp',
                    'Case13-Vbs2DoubleQuoteVbsEventScope.jsp',
                    'Case14-Vbs2SingleQuoteVbsEventScope.jsp',
                    'Case15-Vbs2VbsEventScope.jsp',
                    'Case17-Js2PropertyJsScopeDoubleQuoteDelimiter.jsp',
                    'Case18-Js2PropertyJsScopeSingleQuoteDelimiter.jsp',
                    'Case19-Js2PropertyJsScope.jsp',
                    'Case22-Js2ScriptTagDoubleQuoteDelimiter.jsp',
                    'Case23-Js2ScriptTagSingleQuoteDelimiter.jsp',
                    'Case24-Js2ScriptTag.jsp',
                    'Case27-Js2ScriptTagOLCommentScope.jsp',
                    'Case28-Js2ScriptTagMLCommentScope.jsp',
                    'Case30-Tag2HtmlPageScopeMultipleVulnerabilities.jsp',
                    'Case31-Tag2HtmlPageScopeDuringException.jsp',
                    'Case32-Tag2HtmlPageScopeValidViewstateRequired.jsp'
                ]
            }
        }
    end

    easy_test
end
