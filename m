Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctgwY-0008BH-SM
	for mharc-qemu-trivial@gnu.org; Thu, 30 Mar 2017 16:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctfT3-0004Yg-Tl
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 15:10:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctfT2-0005fs-Tz
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 15:10:45 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ctfSy-0005d9-GX; Thu, 30 Mar 2017 15:10:40 -0400
Received: by mail-oi0-x241.google.com with SMTP id b187so6009844oif.3;
	Thu, 30 Mar 2017 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:reply-to:subject:references:to:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8gDOKmm0NKMzfBbXdbBjPG04umS/x/vj9iI8FRCHsXs=;
	b=jvrtIrdkgbXE8b6GtabzVQ1SkdnWfCCIEMJvTxZN0iQ9EHm77sAsLoWZDMUqgt2vt3
	YnX3wwS6FhTClI9GF/lKIsiC45IRy5pZY2OP3IdZ+lECxf3G3/1vy/QFbetrqfNXdsPy
	xg4A815WZl75biSZvKaiwnFU2m5xL6t+8aWyTr/+tyrYo74g2gLdFtjl8H2qn4dbPbZ1
	9kjEtoyYkfZE99ydAuSD4Pd72T0WFwOfWAUmz8KVGKlV07tG09qRCXE0LEgkfMrVjUHh
	GXOOqMkjeZmcNJ5PQGR6O7rIhk81FYa0Pt155ZuVogwdnbIQJQXUcB8V+4UEoQL/TIPS
	gmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:reply-to:subject:references:to:cc:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=8gDOKmm0NKMzfBbXdbBjPG04umS/x/vj9iI8FRCHsXs=;
	b=gq+W4AgM1Cr1VyDkLZeEvZK72QyxOh7wDPO+um8KRUjaYpsw1VvKS2DUDFbK4PsDXU
	QfIau6y84T4xR9eqpEHSKShOgE0Jg4Rz2Gm/YI0TiQ61acrGPv5PKS0/rdhVeEBB68Fj
	BY+tuKjcIOzKLfRMkTqZOwg5TdzG6hTQ0XrzXUnfIE0AhPCySd8t4hbQiH1yOXdheiKS
	Qx0Os+prbFBVRt3t2+mKNi6uzVfaxWbm0IqflV2Kh7jO9tqmwmWjfxIwOcGxWNk40Hxp
	aPd3ozPkebLmxBEd/tQfPClxUgwB3ZXPAGBAGw/iv6Ln2YKiSnlJkupvy2Nmkr6kfR0M
	9VZA==
X-Gm-Message-State: AFeK/H1egjEuYHHTr36aAbnCgwAVxlsI/xcOM3uPlMWR21O/oIcuvJLIG+eTz6c0Y4CrJQ==
X-Received: by 10.157.56.214 with SMTP id k22mr939738ote.204.1490901039680;
	Thu, 30 Mar 2017 12:10:39 -0700 (PDT)
Received: from serve.minyard.net ([47.184.141.54])
	by smtp.gmail.com with ESMTPSA id
	s198sm1380278oie.33.2017.03.30.12.10.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 12:10:38 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
	by serve.minyard.net (Postfix) with ESMTPSA id 985006E2;
	Thu, 30 Mar 2017 14:10:36 -0500 (CDT)
Reply-To: minyard@acm.org
References: <1490894892-8055-1-git-send-email-minyard@acm.org>
	<0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Corey Minyard <cminyard@mvista.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <71b59e1b-caf0-d7b0-0648-b98d62e66c6b@acm.org>
Date: Thu, 30 Mar 2017 14:10:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
X-Mailman-Approved-At: Thu, 30 Mar 2017 16:45:16 -0400
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v2 resend] ipmi: Fix macro issues
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Mar 2017 19:10:46 -0000

On 03/30/2017 12:53 PM, Eric Blake wrote:
> On 03/30/2017 12:28 PM, minyard@acm.org wrote:
>> From: Corey Minyard <cminyard@mvista.com>
>>
>> Macro parameters should almost always have () around them when used.
>> llvm reported an error on this.
>>
>> Remove redundant parenthesis and put parenthesis around the entire
>> macros with assignments in case they are used in an expression.
>>
>> Remove some unused macros.
>>
>> Reported in https://bugs.launchpad.net/bugs/1651167
>>
>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>>   hw/ipmi/isa_ipmi_bt.c | 34 ++++++++++++----------------------
>>   1 file changed, 12 insertions(+), 22 deletions(-)
> Already reviewed by me, so now I'm just adding commentary: Is this still
> 2.9 material?  It silences a build warning under clang, although I
> didn't analyze whether the unpatched code actually caused an observable
> behavior bug or just compiler noise.
>
I don't believe the code has a bug, going through all the uses there is
no expression used as a parameter or set used in an expression.

That said, it's also not going to hurt anything and it's nice to silence the
warnings.

-corey


