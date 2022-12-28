Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAcAJ-0000Xb-Of
	for mharc-qemu-trivial@gnu.org; Wed, 28 Dec 2022 14:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAcA6-0000Wj-Hh
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 14:32:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAcA3-0006l1-Lx
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 14:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672255941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=142198HEzvZ/6B0fkFKSXEo1rKqVVe9NcGrG45nJG8A=;
 b=BAtDY9Rk6DDoTHy26Eq7zCYHNOyTUMJf/ROOCcwDowhEeGuX+D92qlRNQilH5a85ikHBkR
 TWGHh5LosiJT8hzEL9qQbJ6S+D5Pjv30kQNbdGomDroen+BAvoEeLVJxccHDna9ODD+UIW
 8o5ChYnIpkWnfVlnRTRCUvhiw9k39AU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-nY7LrMbPNhCBaLQ47y-rnA-1; Wed, 28 Dec 2022 14:32:19 -0500
X-MC-Unique: nY7LrMbPNhCBaLQ47y-rnA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r10-20020adfa14a000000b0025ba73dff40so2186634wrr.12
 for <qemu-trivial@nongnu.org>; Wed, 28 Dec 2022 11:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=142198HEzvZ/6B0fkFKSXEo1rKqVVe9NcGrG45nJG8A=;
 b=CtaNQDyB1tvO6BBBCnlvreDcs1illulY1LM6VFDzves6gCgmhO3GuT+FaNQFkorTBn
 8n/q7E513uu4dIrR6b082Q09kMzTCYr8sh1fG+S2DqnakxfYfFo6J1xsXXTxE7lGE9hf
 Bvdbw03tZwrc4dB/3ZpHmwp1jwspSJgDaQql6cwGNDvkKzdpNwfpkCmpvenPqryjkwXh
 8jvirNNa+bTePfo6oIDElEqJaH6PQyuP2lTDlPSfs7XlgBOetTbCvZfV4pOGFwKNChzY
 7zdHelByQSvvkH0ukDZf5j5P0sqkAZNyXTcmkkJTgD5C14Xxj13N7i5vhmQ2Qc6AIDCA
 h+6Q==
X-Gm-Message-State: AFqh2kqYGRQUHEt+k1dlaCHn0FUJjD2RT4W1PKeowla4WQ9zCtsjNMTe
 M4qjKv7ITOqE9DTn71EKxZcf5OO6L+Zt8IVcq4GqVp+R3yK/VIqc4Y5YjmSnKAUy+BdLgnpXJLo
 AWrlZ/tnmfBE6lsMpLA==
X-Received: by 2002:adf:f4c1:0:b0:27e:7f5:6634 with SMTP id
 h1-20020adff4c1000000b0027e07f56634mr6898520wrp.60.1672255938656; 
 Wed, 28 Dec 2022 11:32:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXttxRlmz1AaO6ButbiNgP8QAIhIgXd8QUqetGf6Ce04vOkw1LivuwXhw0+6+3wVnAYQ56mk7Q==
X-Received: by 2002:adf:f4c1:0:b0:27e:7f5:6634 with SMTP id
 h1-20020adff4c1000000b0027e07f56634mr6898510wrp.60.1672255938453; 
 Wed, 28 Dec 2022 11:32:18 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b003d98a7aa12csm8232963wmg.16.2022.12.28.11.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 11:32:17 -0800 (PST)
Message-ID: <6cd36e7e-dae7-6258-736a-44630cee9010@redhat.com>
Date: Wed, 28 Dec 2022 20:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest
 driver
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Claudio Fontana <cfontana@suse.de>,
 qemu devel list <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, wxhusst@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
 <CAC_L=vXsKpai6Wr0Fi2r5sr4U+tshPB9VizqntDppqE=1_FbVQ@mail.gmail.com>
 <339b8c7d-1f54-a515-8854-c22d10f79d1d@suse.de>
 <CAMPkWoOFXfyx=ZOv8i6AJ8Lv2GFKt11gnXYZ2W_4roS9UP9m5w@mail.gmail.com>
 <CAC_L=vUD2vVNSaP7UcDuRUCyd8XNmb4iRY_LXK0UNEE-+Rr4TQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAC_L=vUD2vVNSaP7UcDuRUCyd8XNmb4iRY_LXK0UNEE-+Rr4TQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Dec 2022 19:32:30 -0000

On 19/12/2022 12.21, Marcel Apfelbaum wrote:
> On Mon, Dec 19, 2022 at 10:57 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>
>> Can anyone else pick this one?
> 
> Adding Thomas,
> 
> I dropped the ball with this one, I am sorry about that, maybe it
> doesn't worth a Pull Request only for it.

Why not? Pull request for single patches aren't that uncommon.

> Maybe it can go through the Misc tree?

hw/rdma/ is really not my turf, but since the patch is small, it sounds like 
a good candidate for qemu-trivial, I think.

  Thomas


>> On Wed, 7 Dec 2022 at 17:05, Claudio Fontana <cfontana@suse.de> wrote:
>>>
>>> On 4/5/22 12:31, Marcel Apfelbaum wrote:
>>>> Hi Yuval,
>>>> Thank you for the changes.
>>>>
>>>> On Sun, Apr 3, 2022 at 11:54 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>>>>
>>>>> Guest driver might execute HW commands when shared buffers are not yet
>>>>> allocated.
>>>>> This could happen on purpose (malicious guest) or because of some other
>>>>> guest/host address mapping error.
>>>>> We need to protect againts such case.
>>>>>
>>>>> Fixes: CVE-2022-1050
>>>>>
>>>>> Reported-by: Raven <wxhusst@gmail.com>
>>>>> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
>>>>> ---
>>>>> v1 -> v2:
>>>>>          * Commit message changes
>>>>> v2 -> v3:
>>>>>          * Exclude cosmetic changes
>>>>> ---
>>>>>   hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
>>>>>   1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
>>>>> index da7ddfa548..89db963c46 100644
>>>>> --- a/hw/rdma/vmw/pvrdma_cmd.c
>>>>> +++ b/hw/rdma/vmw/pvrdma_cmd.c
>>>>> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>>>>>
>>>>>       dsr_info = &dev->dsr_info;
>>>>>
>>>>> +    if (!dsr_info->dsr) {
>>>>> +            /* Buggy or malicious guest driver */
>>>>> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
>>>>> +            goto out;
>>>>> +    }
>>>>> +
>>>>>       if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>>>>>                         sizeof(struct cmd_handler)) {
>>>>>           rdma_error_report("Unsupported command");
>>>>> --
>>>>> 2.20.1
>>>>>
>>>>
>>>> cc-ing Peter and Philippe for a question:
>>>> Do we have a "Security Fixes" or a "Misc" subtree? Otherwise it will
>>>> have to wait a week or so.
>>>>
>>>> Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>>> Thanks,
>>>> Marcel
>>>>
>>>
>>> Hi all,
>>>
>>> patch is reviewed, anything holding back the inclusion of this security fix?
>>>
>>> Thanks,
>>>
>>> Claudio
> 


