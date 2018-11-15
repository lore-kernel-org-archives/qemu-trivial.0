Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNPC0-0000oh-QC
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 16:28:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gNPBy-0000oX-GX
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 16:28:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gNPBv-0001e2-1g
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 16:28:50 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gNPBr-0001bz-E5
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 16:28:45 -0500
Received: by mail-wr1-f66.google.com with SMTP id j17-v6so22725216wrq.11
	for <qemu-trivial@nongnu.org>; Thu, 15 Nov 2018 13:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ros6V2EDWRp5cHKSIxkaavmkNJ0kYOzAtzSJKtwSqOo=;
	b=kGXoLLxLT8O1IVGNtNmBWV88T6ygFtrnhDUuHZ9XgfMAxcw1a62tHj4CozN2hSu931
	HS0UcdQUNE/VSnEkRuEvILfnJBqwXrUwcI/RLIgRlVQAzXXgZSRrB1GjbC8P9bOhh7NO
	WecPc3fMHBSk0Y1X3fdRIcd+jJiLmLgYUTdi+GHPRUmmn8oPe7ohYiU8KJPtfNc7bUq5
	9w7Y+SOWYmUmRiWTXEM0dK+LpuR3xyc0hXc8dZfn0wdOqMYV2BD4wcbJ5L/aM0X/ZFap
	tyMTRjS4KpQXF8SDHp+xq2DddtTY8znP8J3Aw9Jj/LWGjipxHORT3A6RkjezkeX+CPoo
	wg/w==
X-Gm-Message-State: AGRZ1gJy2dokqr5w4MNUEEWslCMRUrm0TZUzNtlsQiJhJDEXbbH0dWDI
	QONJGdXJC2XWxZpKvRNyAmC6gw==
X-Google-Smtp-Source: AJdET5eFyCwlyzjc9GWG1sxW8zvR9OvWxsOAXV2slMjxBKT/2OPUCMJFgSMYtGaJI2eD8e3s5E6ikw==
X-Received: by 2002:adf:9403:: with SMTP id 3-v6mr7459976wrq.54.1542317314273; 
	Thu, 15 Nov 2018 13:28:34 -0800 (PST)
Received: from [192.168.1.36] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	u8-v6sm20058038wrr.33.2018.11.15.13.28.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 13:28:33 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
References: <20181115211752.1295571-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6b396af0-d76e-cfcf-d312-e0db272f97d5@redhat.com>
Date: Thu, 15 Nov 2018 22:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115211752.1295571-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] typedefs.h cleanup
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
X-List-Received-Date: Thu, 15 Nov 2018 21:28:51 -0000

On 15/11/18 22:17, Eric Blake wrote:
> Prompted by my review of xiezhide's work.  No semantic change, but
> not technically a bug fix, so I don't care if it goes in 3.1 or
> waits for 4.0.
> 
> Eric Blake (2):
>    typedefs: (Re-)sort entries alphabetically
>    numa: Match struct to typedef name

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


