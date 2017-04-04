Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cvLUl-0008Uc-4z
	for mharc-qemu-trivial@gnu.org; Tue, 04 Apr 2017 06:15:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cvLUi-0008TC-Ti
	for qemu-trivial@nongnu.org; Tue, 04 Apr 2017 06:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cvLUi-0006bM-6Y
	for qemu-trivial@nongnu.org; Tue, 04 Apr 2017 06:15:24 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cvLUd-0006Yj-VP; Tue, 04 Apr 2017 06:15:20 -0400
Received: by mail-qk0-x244.google.com with SMTP id p68so2593454qke.1;
	Tue, 04 Apr 2017 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=eEfWS+L0zJpJQBobYSFYyim0hf+HDu0za74PLZ+uIxs=;
	b=Z/fqQDyGOxtlyVJQA/+hOWqbskjFWwyv0f5/JP74Y+ejwXQ5BSfVOxX4/eeRHWhO8w
	pdQALA1gtub6SYGznl2KstBVZ7NjVtuazD+BhykGyrQt00w80ZlgpIs9+rYdxMaCOL/0
	aaf4kUkI4MrvJ/V2Eg6wuRHVhuPuQK4TW5/LMsDZTLpGCUmnqRDPQmfhSoWVMJgI9eFO
	r6eo8FUxdExkJqf6FwHXDPYy6XbaZ4Rg7yhLC5qEOqtdIB66zp80ZXnn9LWBSb7FpIFO
	oDb1JPRNu9ia2jsyu1EOHtBZ+9D61+uCIw9a4P1EY1egZsIgeWIcVzefpNmBmlyh+dta
	QPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=eEfWS+L0zJpJQBobYSFYyim0hf+HDu0za74PLZ+uIxs=;
	b=TTFKekSqXvU4Ivq9OS06OsJMSHfUxxR9a34J7y1YJWal5fB16yOAu2yIvhPiYUniS9
	gS3uHGXcsQ1BoEOrA/AemrvHODm2E85n0KUtt9mrt/ui4BNP89CeiyTlzSyo4GIOO4jI
	HbPllLCewLLLqb/VQlg8GIKe1xy+Z7tYA7QwaqOPiDinVREXX8BtplXx17J9Nxy90ALg
	8deL6/gYALg5ANFubqUdzHGcL9vcagBJQLu8Cuex6ydzyPHkuEs6GLc6DeXt06XSSpm2
	5Oxn91tZeE7WznkdDnk9I5riHRQ1144+qHxCjMbtBdNeRIs8zVcas04W02CCHqyUVhaS
	lxOQ==
X-Gm-Message-State: AFeK/H3YpOL7qj/iruCyQIe3+hqSxROYtT3/icagU4czcRMMo/PhforvW7WwaWCALK5aMA==
X-Received: by 10.55.137.7 with SMTP id l7mr22364453qkd.11.1491300919310;
	Tue, 04 Apr 2017 03:15:19 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	y48sm11504887qtc.33.2017.04.04.03.15.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Apr 2017 03:15:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170320173828.3874-1-sauravsachidanand@gmail.com>
	<076d02e7-643c-5d8b-fcef-8660e1269a05@amsat.org>
	<CAFEAcA9__yPLkfyjqp62F7T0gYMFdKoNZH=hJN9RN9x6+guRDA@mail.gmail.com>
Cc: Saurav Sachidanand <sauravsachidanand@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Hajnoczi
	<stefanha@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0ba0e60d-aa7f-eb38-a303-ea06f07f61d7@amsat.org>
Date: Tue, 4 Apr 2017 07:15:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9__yPLkfyjqp62F7T0gYMFdKoNZH=hJN9RN9x6+guRDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5] util: Use
 g_malloc/g_free in envlist.c
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
X-List-Received-Date: Tue, 04 Apr 2017 10:15:25 -0000

On 03/28/2017 10:47 AM, Peter Maydell wrote:
> On 28 March 2017 at 14:44, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Saurav,
>>
>> you should read the QEMU Coding Style and replace your tabs by 4 spaces.
>
> Er, in review comments on v3 we said not to do that...

oops I missed Stefan comment in v2, sorry!

>
> thanks
> -- PMM
>

