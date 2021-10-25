Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mew75-000483-9v
	for mharc-qemu-trivial@gnu.org; Mon, 25 Oct 2021 05:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mew6y-00045b-2Z; Mon, 25 Oct 2021 05:17:44 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mew6t-0004zy-7u; Mon, 25 Oct 2021 05:17:43 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4NHS-1mm79Z2X1q-011RDK; Mon, 25 Oct 2021 11:17:31 +0200
Message-ID: <a0a7067e-75b1-9f3f-77ca-6fd5060d87a0@vivier.eu>
Date: Mon, 25 Oct 2021 11:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Trim some trailing space from human-readable output
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
Cc: jiri@resnulli.us, ehabkost@redhat.com, david@redhat.com, groug@kaod.org,
 qemu-devel@nongnu.org, jcmvbkbc@gmail.com
References: <20211009152401.2982862-1-armbru@redhat.com>
 <87v91lii2b.fsf@dusky.pond.sub.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87v91lii2b.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lEjVD4ZFRQF3QeqEqxLkaGs83tRBmvHRMoAH/dsc5NKi56ME7/z
 U8pC6urppR5vZmpp4MGaOv4m6ClVLd91V8SBVL6UVaMwqlOFcdEuaSZUmEQDk7xTP0R6NxV
 BLI1Oe/FbxqTuDU2mXOwXBfuegtbDeIZzLyGgdmvD2WTACus9HZ8PVo6QY1307AEDomApBO
 hyHjGumVgFlca9BLz1R8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aDr5WlF+30c=:RTVptq4FysCqjvqqp38kAs
 8oX6AtKuy8OnFWq7W5pALR/KUk+Zu55ESb7lGe+sgheuQsapb9MDcYA+anO/YeM+f2jmfTuy0
 YYiaRinODrlF6w6pacWlXT3/qhnj706+D9yLMCOB8tIh0u+uPEuoPa43BhssjHgBbF7FbKXXs
 2ObiW1VlDvHdjC1XC/IlxE46zxjD54E1rBGFqA0RrG8OOZB8pnW8heqemPVUaAhftG6xNeXvN
 EGStnqQEzostUVTdK/TVTryeUlcHJT7aWWo0eSHuheWMrsXjizrYnFA3rLq2dHc56bks408Ig
 muysCCk3yW8udorIVPjrekcvJuztUnt/rynh8cntDli1NNUeR1URCOAHJRmaE8nyQ+/d9ngk9
 gn4GEoxDH0V3i3IId2uWaiEwYWkrb6KAXVWm3BjNGko/c120CePHDKAkIzhLAqjc0ooySR9qb
 3Il8v+kvVLsAWYyyjLfXVirQOSKmJdrXqFxYKFjppfvWCOo4+qryutvOXXT0uUnXdxWN7i4nM
 EBXOnChdDhCbb+GT7++G9txsReBnlVJjhfMsiinlY1fgAtHNMYMrjsWv6FfTVSWNRXG22HWA6
 WED+xFX2wpf8XS/Yy5hF3+rknOUCE68oSMVKfn27G3KkxRYijfTjNLcQztAdD8qCvPgjhF6U/
 MRTle9W6cFdZ73x+OS9kSw/hzxcv4QoRrsz9iDbxb9quXnPOxnYJymzyn5pKdOzZfLVY=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.33,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 25 Oct 2021 09:17:48 -0000

Le 25/10/2021 à 11:12, Markus Armbruster a écrit :
> Nominating for qemu-trivial.
> 
> Tweaking the subject to
> 
>      monitor: Trim some trailing space from human-readable output
> 
> as Philippe suggested would be nice.
> 
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> I noticed -cpu help printing enough trailing spaces to make the output
>> at least 84 characters wide.  Looks ugly unless the terminal is wider.
>> Ugly or not, trailing spaces are stupid.
>>
>> The culprit is this line in x86_cpu_list_entry():
>>
>>      qemu_printf("x86 %-20s  %-58s\n", name, desc);
>>
>> This prints a string with minimum field left-justified right before a
>> newline.  Change it to
>>
>>      qemu_printf("x86 %-20s  %s\n", name, desc);
>>
>> which avoids the trailing spaces and is simpler to boot.
>>
>> A search for the pattern with "git-grep -E '%-[0-9]+s\\n'" found a few
>> more instances.  Change them similarly.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
> 

Applied to my trivial-patches branch with updated subject

Thanks,
Laurent


