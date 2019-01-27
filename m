Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnpYu-0004Ux-Gt
	for mharc-qemu-trivial@gnu.org; Sun, 27 Jan 2019 13:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnpYs-0004Sj-49
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 13:53:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnpYp-0001ki-CL
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 13:53:41 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnpYl-0001ZR-Iq
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 13:53:38 -0500
Received: by mail-pl1-x643.google.com with SMTP id gn14so6736663plb.10
	for <qemu-trivial@nongnu.org>; Sun, 27 Jan 2019 10:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Go/7rC3agzjwHxfJlBpg2paIhU9FDdqtBuES5TAd3BY=;
	b=VcdLz8VpOsQ442Vhi9crq7Q6KGo8ejnSQMwEwxFxb1ocDP47hsPUU/dFVzIYiX0c8d
	rt2hKqhK2++ehAz9b0BrtBOT3kdFNPIEcy18MxClDTi4VVhRDWivBQPtJSt9lZEKUlLt
	3zEfbtRERLk01zVaToekriSSUvfedRP09jr9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Go/7rC3agzjwHxfJlBpg2paIhU9FDdqtBuES5TAd3BY=;
	b=Hl7g50LMwgHEVuHHB4aSIwm79CskYLg8f659lAm5x3DwAAgHg2re6tieTXCuYOArtQ
	9gLm6jF0qoB4Qs9oKb48imyLz2uCbZueG5XC+tltIx/khNhJIyVy/z7go4cmaIOW9tbh
	9MVcM4y881qe90I/tbQhhr2df0MDNLpRPFbQJxFvl67Zbx1yjEgB6Ayto8ZLpDCjvCMA
	CHNm/5EezhxLUgzArDhNHZ/BkXMnoL8dFAQlXPErAYVC7BaiN2xgWxPHjUZknx5GZRP6
	ojThvC8UjCzIbdgw24wXsw2nnY2Zq+iDw721tdgKXCSkoBNCjPl5w8WFAPa5T8jBiyJg
	Uq+Q==
X-Gm-Message-State: AJcUukcTDND0E8puCwtPyt8poaKSkWfXE8kV2aOqNvHzY5JmpdjjGoTs
	uApV63Dvv9/TWfmKIsgV+AW/8nwupH8=
X-Google-Smtp-Source: ALg8bN61yN22wNGV3lEy7rbg+Nez2WhThhEZJqIZq/FUeAyB8QKSIik2DVmiAaMiRvG6YsDNdqjELQ==
X-Received: by 2002:a17:902:ab92:: with SMTP id
	f18mr18280114plr.221.1548615201351; 
	Sun, 27 Jan 2019 10:53:21 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	l11sm39401942pff.65.2019.01.27.10.53.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 10:53:20 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1548252536-6242-1-git-send-email-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0d8758ef-cb62-61cb-db8e-ed4f75d94063@linaro.org>
Date: Sun, 27 Jan 2019 10:53:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548252536-6242-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Clarify the LGPL
 version in some files
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
X-List-Received-Date: Sun, 27 Jan 2019 18:53:43 -0000

On 1/23/19 6:08 AM, Thomas Huth wrote:
> Thomas Huth (4):
>   COPYING.LIB: Synchronize the LGPL 2.1 with the version from gnu.org
>   target/openrisc: Fix LGPL version number
>   target/tricore: Fix LGPL version number
>   tcg: Fix LGPL version number

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


