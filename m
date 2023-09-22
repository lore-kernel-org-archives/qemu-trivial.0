Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qjhj4-0002Zv-KW
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2023 11:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qjhj3-0002Zd-6t
 for qemu-trivial@nongnu.org; Fri, 22 Sep 2023 11:05:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qjhj1-0003Y2-HV
 for qemu-trivial@nongnu.org; Fri, 22 Sep 2023 11:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695395145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaY+EaPYPn6W5RP9k4/QfYSvxYRIqgYMYV5SM1qbIaA=;
 b=ewkobTo+rzM4SVXNZ9oP3vJB6xwzWbT87Oh1Jmvz3Wn7vpheTA10pNaY/4aO28vMKDXAZi
 tpiof0yRAH5Hfy50ongQ+L+CUelcf5sWZ3LQfdQJRkW0tlA3P9GxwpfLXo6paji0qdclsZ
 KMerVdXheAPBq8WOhZImps2uasr40Po=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-rEVIqjkMOBKfh76K6FZ9CQ-1; Fri, 22 Sep 2023 11:05:44 -0400
X-MC-Unique: rEVIqjkMOBKfh76K6FZ9CQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-313c930ee0eso1459122f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2023 08:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695395143; x=1695999943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qaY+EaPYPn6W5RP9k4/QfYSvxYRIqgYMYV5SM1qbIaA=;
 b=BRivj4T2zocxnK+s9+cEcXfdkJGuinmXr39KWVnKhA1ev4n1ah7fsIuLZuur4oPRrh
 J6sC8g01nDmnslZC3pqsYqheqhzRX3jTRZ3PE/M/hwSvcRwCY7V4IUykK4b27bz+LT+r
 +usXjRMUHUIMrQJoLDaAbMJL7m9B7qCeBYLOtOaNwmH16fslOYbuivNd3ER4SS3MJCQ7
 VmqXnCiEgxFPoC6bFaJnluh0ltL9XpyDC8sBZmm00DqmGgc14w5tfqEiDwGI63n6QzSs
 bCOco84qMaWC8qkO4YXDN/3zheExIMJKe+ijKBN8VLYSG9CCa4Mx4KEoVFYUFBGORlq+
 P+ug==
X-Gm-Message-State: AOJu0YycxNeNIjF+wD13+Gfvnp8klXLaoDsBTc1XhEXygBE+71fv6q0V
 2Osu4ZDV8l/DzP+xG7XSdS9H3JL9UB+uTKCh8Br4hvW0fnXVvLeLe0kTr94tfyoZ+LuARR1r2NA
 QhVBMp11mJPYwf4+AlA==
X-Received: by 2002:a05:6000:12c6:b0:319:6e74:1637 with SMTP id
 l6-20020a05600012c600b003196e741637mr7698827wrx.27.1695395143276; 
 Fri, 22 Sep 2023 08:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXUg1MqLWArLUZt4S9VdDMlkK5t5oMZp+giJC8SFNd+h6Wcm1wtzFNwmSX4qZWrtJvonVCcQ==
X-Received: by 2002:a05:6000:12c6:b0:319:6e74:1637 with SMTP id
 l6-20020a05600012c600b003196e741637mr7698810wrx.27.1695395142929; 
 Fri, 22 Sep 2023 08:05:42 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-48.web.vodafone.de.
 [109.43.176.48]) by smtp.gmail.com with ESMTPSA id
 c5-20020adfed85000000b0032196c508e3sm4659103wro.53.2023.09.22.08.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 08:05:42 -0700 (PDT)
Message-ID: <15dad0a8-e31f-3387-4ade-45d4a9b8a6c4@redhat.com>
Date: Fri, 22 Sep 2023 17:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.1] hw/rdma/vmw/pvrdma_cmd: Use correct struct in
 query_port()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230725113632.2386874-1-peter.maydell@linaro.org>
 <CAFEAcA-DXnmtfKYrOjrSRp=rjdV-Owqm+b0=oB6y-=H=VP9fLg@mail.gmail.com>
 <CAFEAcA8YxuRGp5sfXauWfiTsOE7H6hkbRKp1Pp0ampxsct5hQg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8YxuRGp5sfXauWfiTsOE7H6hkbRKp1Pp0ampxsct5hQg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Sep 2023 15:05:49 -0000


Reviewed-by: Thomas Huth <thuth@redhat.com>

Maybe this could go via qemu-trivial?

On 12/09/2023 16.08, Peter Maydell wrote:
> Ping^2 for review/pickup by the rdma folks, please?

Is anybody still using this subsystem? ... if not, then it's maybe time to 
set this on the deprecation list? ... just my 0.02 €.

  Thomas


> 
> On Tue, 29 Aug 2023 at 16:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 25 Jul 2023 at 12:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> In query_port() we pass the address of a local pvrdma_port_attr
>>> struct to the rdma_query_backend_port() function.  Unfortunately,
>>> rdma_backend_query_port() wants a pointer to a struct ibv_port_attr,
>>> and the two are not the same length.
>>>
>>> Coverity spotted this (CID 1507146): pvrdma_port_attr is 48 bytes
>>> long, and ibv_port_attr is 52 bytes, because it has a few extra
>>> fields at the end.
>>>
>>> Fortunately, all we do with the attrs struct after the call is to
>>> read a few specific fields out of it which are all at the same
>>> offsets in both structs, so we can simply make the local variable the
>>> correct type.  This also lets us drop the cast (which should have
>>> been a bit of a warning flag that we were doing something wrong
>>> here).
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> I don't know anything about the rdma code so this fix is based
>>> purely on looking at the code, and is untested beyond just
>>> make check/make check-avocado.
>>> ---
>>>   hw/rdma/vmw/pvrdma_cmd.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
>>> index c6ed0259821..d31c1875938 100644
>>> --- a/hw/rdma/vmw/pvrdma_cmd.c
>>> +++ b/hw/rdma/vmw/pvrdma_cmd.c
>>> @@ -129,14 +129,13 @@ static int query_port(PVRDMADev *dev, union pvrdma_cmd_req *req,
>>>   {
>>>       struct pvrdma_cmd_query_port *cmd = &req->query_port;
>>>       struct pvrdma_cmd_query_port_resp *resp = &rsp->query_port_resp;
>>> -    struct pvrdma_port_attr attrs = {};
>>> +    struct ibv_port_attr attrs = {};
>>>
>>>       if (cmd->port_num > MAX_PORTS) {
>>>           return -EINVAL;
>>>       }
>>>
>>> -    if (rdma_backend_query_port(&dev->backend_dev,
>>> -                                (struct ibv_port_attr *)&attrs)) {
>>> +    if (rdma_backend_query_port(&dev->backend_dev, &attrs)) {
>>>           return -ENOMEM;
>>>       }
>>
>> Ping for review/testing by the rdma folks, please ?
>> Whose tree should this patch go through?
> 


