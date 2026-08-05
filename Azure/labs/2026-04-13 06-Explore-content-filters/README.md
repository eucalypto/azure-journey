# [Lab: Apply guardrails to prevent the output of harmful content](https://microsoftlearning.github.io/mslearn-ai-studio/Instructions/Exercises/06-Explore-content-filters.html)

**Certification:** AI-900  
**Module:** [Implement a responsible generative AI solution in Microsoft Foundry](https://learn.microsoft.com/en-us/training/modules/responsible-ai-studio/)  
**Date completed:** 2026-04-13  


## Scenario

> A company wants to use an AI solution and wants to make sure it does not create harmful content.


## What I Did

With the help of the Lab I had a look at the Azure AI Guardrails settings. All deployed models have the default guardrails activated, but I can create a custom one and set it up to the needs of my project/organization. I've set the triggers to very sensitive and indeed, the guardrails stop the request sooner.


## Screenshots

Trying to trigger the default content filter:
![](./screenshots/trying_to_hit_default_content_filter.jpg)

After setting the content filter to highest sensitivity:
![](./screenshots/content_filter_highest_sensitivity.jpg)

## Gotchas & Learnings

- **Gotcha:** Trying to hit the content filter in default mode is harder than expected. The model itself has also built-in guardrails so that the content filter does not have to do all the work.    
    **Takeaway:** When the content filter is not triggered, the model returns a full answer and includes an explanation that it can't help with the possible intended harmful action. But when the content filter is triggered, it produces a distinct message in the model playground and gives no output of the model, and in a python program, it produces an error that is raised:

  

When the content filter is triggered from a [Python code](./python_with_completions_api.py), the following Error is raised and the program crashes:
```
"openai.BadRequestError":"Error code":400 -{
   "error":{
      "message":"The response was filtered due to the prompt triggering Azure OpenAI’s content management policy. Please modify your prompt and retry. To learn more about our content filtering policies please read our documentation: https://go.microsoft.com/fwlink/?linkid=2198766",
      "type":"invalid_request_error",
      "param":"prompt",
      "code":"content_filter",
      "content_filters":[
         {
            "blocked":true,
            "source_type":"prompt",
            "content_filter_raw":[
               
            ],
            "content_filter_results":{
               "hate":{
                  "filtered":false,
                  "severity":"safe"
               },
               "sexual":{
                  "filtered":false,
                  "severity":"safe"
               },
               "violence":{
                  "filtered":true,
                  "severity":"high"
               },
               "self_harm":{
                  "filtered":false,
                  "severity":"safe"
               },
               "jailbreak":{
                  "filtered":false,
                  "detected":false
               }
            },
            "content_filter_offsets":{
               "start_offset":3751,
               "end_offset":3802,
               "check_offset":0
            }
         }
      ]
   }
}
```






