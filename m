Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRcFJ-0007zu-9w
	for mharc-qemu-trivial@gnu.org; Sat, 09 Jun 2018 07:41:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRcFH-0007zf-7i
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2018 07:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRcFG-0005ka-Ju
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2018 07:41:23 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:40322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fRcFG-0005k4-FB
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2018 07:41:22 -0400
Received: by mail-ot0-x241.google.com with SMTP id w9-v6so13192846otj.7
	for <qemu-trivial@nongnu.org>; Sat, 09 Jun 2018 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=keAmfY//50emjVDsWQNJhvqVbvQdrMk7AbvjSH0B0ek=;
	b=DWKu9Osya++BtlCIFpiekpenTJ3j8mQDdRRhpGJFFJGxOswh4ExvHHsXDZQHOO9Nb9
	7pX9boPsU4fqFReXQu1DA8/wQ9NLaJDgXmuGzNN1VyMTgcRV2FpOnZU9zA6bG8ynDdaM
	FqqcArxTT7FVCtZ35ZOEnX1/+Q3VE56WDUI1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=keAmfY//50emjVDsWQNJhvqVbvQdrMk7AbvjSH0B0ek=;
	b=Ddwbo9BsHn9iWaU2LSDNYBQp6p/CSiLxwBPPIWn8lj9k+Lqv2mVdA0cwZes0Y6H25p
	86wmnijCUpe5X/xuDQvfuvygW6p4eZILbNPWwBL9E/iqgZ9RHuSfOxk8LiorvZcb3GYl
	akjR9outSHbbihfD8zWWSQKJA4lRI/0aI9YiMr6FqmcTtB4AWE4000tcqdFSYpB+ot4r
	9iAXv8a4E25PSs75Frp+eGB9vtLX7+KAD54z7jLChz4VzoC7WIikrJpfc/Uts4nacIFn
	28skpmeTSrMHm/y1F92xoGw3MEZIIO56f5C5EvkVxZArWhgcw90KeJPBRu+AvNhkSxiy
	uStw==
X-Gm-Message-State: APt69E2UVig6gtt5zIvgEyrJtTPF6SSdmISpBVqD8JfmAgQb6hpAc46S
	fzXxJaBjO9t+9E/GnhfxvFvimenH0XOBYf8VG5pyTA==
X-Google-Smtp-Source: ADUXVKKRL/6VV/GBh9qRWuKcf9KBnomdJQzL3B++c7IeCYOWtn0gqCxJqW0pojM7yjGgQ5I/Ly4S6nnUC+Ia293wNSU=
X-Received: by 2002:a9d:3d76:: with SMTP id
	a109-v6mr3475905otc.294.1528544481707; 
	Sat, 09 Jun 2018 04:41:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Sat, 9 Jun 2018 04:41:01 -0700 (PDT)
In-Reply-To: <20180608185826.10708-1-f4bug@amsat.org>
References: <20180608185826.10708-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 9 Jun 2018 12:41:01 +0100
Message-ID: <CAFEAcA8aVX6RjzDJ6+VxM3mENHP-aE6DYbZjhboCc+46bAnoAQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Remove
 qemu-version.h and qemu-options.def during 'make distclean'
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
X-List-Received-Date: Sat, 09 Jun 2018 11:41:24 -0000

On 8 June 2018 at 19:58, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> qemu-version.h and qemu-options.def are generated files
> that should be deleted during 'make distclean'.

These are both in GENERATED_FILES, and 'make distclean'
invokes 'make clean' which does an rm of all GENERATED_FILES.
Why isn't that sufficient here?

thanks
-- PMM

