# [Lab: Apply guardrails to prevent the output of harmful content](https://microsoftlearning.github.io/mslearn-ai-studio/Instructions/Exercises/06-Explore-content-filters.html)

**Certification:** AI-900  
**Module:** [Implement a responsible generative AI solution in Microsoft Foundry](https://learn.microsoft.com/en-us/training/modules/responsible-ai-studio/)  
**Date completed:** 2026-04-13  


## Scenario

> _Rewrite the lab's business context in your own words. Example: "Contoso Ltd needs to segment network access so the finance team's VMs cannot reach the dev team's VMs, while both can access a shared database subnet."_


## What I Did

Brief narrative of implementation steps — not a copy of the lab instructions, but your own summary of the decisions made and resources created.

## Screenshots

| Step                      | Screenshot                             |
| ------------------------- | -------------------------------------- |
| Resource group created    | ![](./screenshots/01-rg-created.png)   |
| NSG rules configured      | ![](./screenshots/02-nsg-rules.png)    |
| Connectivity test passing | ![](./screenshots/03-ping-success.png) |

## Gotchas & Learnings

When the context filter is triggered from a [Python code](./python_with_completions_api.py) with the Completions API, the following Error is raised and the program crashes:
```
openai.BadRequestError: Error code: 400 - {'error': {'message': "The response was filtered due to the prompt triggering Azure OpenAI's content management policy. Please modify your prompt and retry. To learn more about our content filtering policies please read our documentation: https://go.microsoft.com/fwlink/?linkid=2198766", 'type': None, 'param': 'prompt', 'code': 'content_filter', 'status': 400, 'innererror': {'code': 'ResponsibleAIPolicyViolation', 'content_filter_result': {'hate': {'filtered': False, 'severity': 'safe'}, 'jailbreak': {'filtered': False, 'detected': False}, 'self_harm': {'filtered': False, 'severity': 'safe'}, 'sexual': {'filtered': False, 'severity': 'safe'}, 'violence': {'filtered': True, 'severity': 'high'}}}}}
```

- **Problem:** [What went wrong or confused you]  
    **Fix:** [How you resolved it]  
    **Takeaway:** [What you now understand better]
    
- **Problem:** ...  
    **Fix:** ...  
    **Takeaway:** ...
    




