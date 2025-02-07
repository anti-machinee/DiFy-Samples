# code_executor.py
- [1]
## CodeExecutor.execute_workflow_code_template
- Get runner script for specific language (Python, JavaScript, Jinja2)
- Replace placeholders with inputs from Frontend
- Get preload script (For Jinra2 only)
- Execute code
## CodeExecutor.execute_code
- Prepare API request
- Send request to sandbox service
## Error handling
- Error catchted
    - 503
    - !200
- Catching CodeExecutionError Separately
    - If CodeExecutionError was already raised (e.g., due to 503), it is simply re-raised without modification. This ensures that a specific code execution failure is not mistakenly wrapped as a generic network issue.
- Handling General Exceptions and Wrapping Them
    - If any other exception occurs (e.g., network timeout, invalid response format, etc.), it is caught and wrapped inside a CodeExecutionError. This provides a more specific error message, hinting that the failure is likely due to network issues rather than the execution service itself

# Further analysis
## Where this code is used?
- CodeNode
    - Output of CodeExecutor.execute_workflow_code_template will be validated before sending to Frontend
- TemplateTransformNode
## Why Wrap General Exceptions?
- Consistency – Ensures all errors related to execution failures are raised as CodeExecutionError, making it easier to handle at higher levels.
- Better Debugging – The final error message includes the original error (str(e)) for debugging while still guiding the user on potential causes.
- Separation of Concerns – The service unavailability (503) is treated differently from general failures to distinguish between service-side issues and network/client issues.
## Why need to call Sandbox Service but not using internal function call?
- [1]

# References
- [1] https://docs.dify.ai/guides/workflow/node/code