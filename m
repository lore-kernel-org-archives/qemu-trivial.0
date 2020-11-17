Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kezI3-00017G-LG
	for mharc-qemu-trivial@gnu.org; Tue, 17 Nov 2020 06:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kezI1-000168-CS
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 06:36:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kezHx-0004rn-7b
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 06:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605613003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDcJumz0RhAS71FGnmYH8FU8UBg0fpE+S0Ccx5gDrus=;
 b=Pmvv5PoeoNYxwJht0FyYB+W6tYJ4hzfHKOWtOvytnaXoGg6nDMa5bP5yxUk2hQRxcbBDZF
 eZPYQZfg4N2zTSVS6aoAShCNi9EUfuAvTN4uUOe6/WF8H0TZULItETyrGnjjl3wwsKKNHg
 n67nLYMeUcOb/Xi+4u7Hn9IDgEZU994=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-D20qkvKrM3KqasMc_du_-A-1; Tue, 17 Nov 2020 06:36:39 -0500
X-MC-Unique: D20qkvKrM3KqasMc_du_-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95E8A8030B9;
 Tue, 17 Nov 2020 11:36:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AD956EF43;
 Tue, 17 Nov 2020 11:36:34 +0000 (UTC)
Subject: Re: [PATCH 2/2] plugins: Fix two resource leaks in connect_socket()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alex Chen <alex.chen@huawei.com>
Cc: Laurent Vivier <laurent@vivier.eu>, mjt@tls.msk.ru,
 qemu-trivial@nongnu.org, zhengchuan@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
References: <5F9975F1.4080205@huawei.com>
 <c91f4827-0be0-b0d1-f183-d3d868079a50@redhat.com>
 <5FB3239E.6030709@huawei.com> <87k0ukw70v.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <68ea4519-c03a-8efb-9e26-7ab3350fe2f6@redhat.com>
Date: Tue, 17 Nov 2020 12:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87k0ukw70v.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Nov 2020 11:36:49 -0000

On 17/11/2020 12.35, Alex Bennée wrote:
> 
> Alex Chen <alex.chen@huawei.com> writes:
> 
>> On 2020/11/17 0:50, Thomas Huth wrote:
>>> On 28/10/2020 14.45, AlexChen wrote:
>>>> Either accept() fails or exits normally, we need to close the fd.
>>>>
>>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>>> Signed-off-by: AlexChen <alex.chen@huawei.com>
>>>> ---
>>>>  contrib/plugins/lockstep.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
>>>> index 319bd44b83..5aad50869d 100644
>>>> --- a/contrib/plugins/lockstep.c
>>>> +++ b/contrib/plugins/lockstep.c
>>>> @@ -268,11 +268,13 @@ static bool setup_socket(const char *path)
>>>>      socket_fd = accept(fd, NULL, NULL);
>>>
>>> I think you could also simply close(fd) here instead, then you don't have to
>>> do it twice below.
>>>
>>
>> Hi Thomas and Alex,
>> Thanks for your suggestion. It's a simple and effective solution.
>> Considering that the patch v3 has been queued by Alex Bennée,
>> May I modify this patch and then send patch v4?
> 
> The fix has already been merged so a fresh patch would make more sense.

Well, then never mind. It's not worth the code churn to just get rid of one
line of code, I think.

 Thomas


