Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1mNm-0007zI-F1
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jul 2021 05:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mNc-0007xQ-Jx; Fri, 09 Jul 2021 05:01:08 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:47237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mNY-00088o-Gv; Fri, 09 Jul 2021 05:01:04 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MRC7g-1lpjfv3ZvI-00N6Rr; Fri, 09 Jul 2021 11:00:56 +0200
Subject: Re: [PATCH] qemu-option: Drop dead assertion
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com
References: <20210610085026.436081-1-armbru@redhat.com>
 <deea178f-ea30-e2ca-4d0e-61a8c02b3b67@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <552af1a9-d96a-2ddb-0158-542c68b138b3@vivier.eu>
Date: Fri, 9 Jul 2021 11:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <deea178f-ea30-e2ca-4d0e-61a8c02b3b67@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BVXqFqZNILeyMzGUSJlTIJNNM98Agz8NxWsguy/hyL+qBQDfhW3
 mO8XCf5V/rL2dq8t5xQF+O7q8nxnVkJhKI3LuXP0f27JhtFYJijYd45RAQ+b8K2tmnVimu6
 efIVJ1QxYdSaoLL8vpwtJKkIzb0OEkUtAs6PYc4Tokm2kGc02eerDLDQwFUyEkSFWsQqffE
 2/4cq+NIfgfOcT0zgaVmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CXPbWffpMz0=:OXFqVPShIVFmamxdOfJwcL
 OUnkbiv5vIaUfcNvU6va6RSdvY9nsURpSWq4t70kDL0YfvtDdRQLdg5yeYBBjd3tbnGjH+CEa
 RAOoReLJS/izAoYYY6nzmPY+YHewhF5R93uG9dlJLVXRL1gDn0A20pX4jZfbn1YuWqQ5xrXEh
 tP6OvKEL5LrTvkZ4GFSJmDh3VjFMafZVC3RAEEamXPJWUl4vEFOk9fx/ZTvlWoNRmBDOmAOWF
 PYn2H5fMYFLa4+eDTAp+mm5BNsTEJTlAxqWofJAYaVYx0/dNpKDxRInRGZMCLiT15uYKh9P1B
 o43+fGrJiEX7fxBNnS9lP64zzfn7jFQSJvje54JGupQvHdck1uBsYuZXlkUtEDVRBvNkpj2cA
 5fnY5gUvrBzFHFdgaPKsoWYx5j60Mhb38XuRK4la4vUFeXJJ2d/DyD9JaNGx7p4QLjyXpPQqc
 WFPOjqd1bLMlRGyqyVW4KHqAWyJnbSp3RohaFnxXOhB/ljj0CsQCq6QkjBc7Aw9sNqLiT5aau
 aidbBWApuwTVx+IxiGcbdlnfJ5Won1CORXUZ0XfAhqw97Epsd+LgYj98BRGJzcJkk6XEuuQzS
 0SonyuW4aJcyUVgyZkLfqUx/cYjKlo7cwGLa3NuVnAc2nvjmV5iEZ4MhjTE4luE5IKeSrEjZf
 WuYUfmmJpejHBlFptfqn9xTAesG1xkVj6TRaP0RBimNIDZP7bFF0fkJ7Y78+Soy88ns+8VblV
 GPad1ZO+edG5ypveiNZ/oRnzbubML1G7CUJqRnUBoxxNqjSNEZK+W6hYX7CvLJq5YSyfNw9iT
 usRoCIUiIYgToBBQr5dtqMRDedBPsCveeS84GRqa/i+ALghcWVnFOOzfXyZGN7M5TuPDBQn
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jul 2021 09:01:10 -0000

Le 10/06/2021 à 11:29, Thomas Huth a écrit :
> On 10/06/2021 10.50, Markus Armbruster wrote:
>> Commit c6ecec43b2 "qemu-option: Check return value instead of @err
>> where convenient" simplified
>>
>>      opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1,
>>                              &local_err);
>>      if (local_err) {
>>          error_propagate(errp, local_err);
>>          return NULL;
>>      }
>>
>> to
>>
>>      opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1, errp);
>>      if (!opts) {
>>          return NULL;
>>      }
>>
>> but neglected to delete
>>
>>      assert(opts != NULL);
>>
>> Do that now.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   util/qemu-option.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/util/qemu-option.c b/util/qemu-option.c
>> index 4944015a25..3fa0b13378 100644
>> --- a/util/qemu-option.c
>> +++ b/util/qemu-option.c
>> @@ -1028,8 +1028,6 @@ QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
>>           return NULL;
>>       }
>>   -    assert(opts != NULL);
>> -
>>       for (entry = qdict_first(qdict);
>>            entry;
>>            entry = qdict_next(qdict, entry)) {
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


