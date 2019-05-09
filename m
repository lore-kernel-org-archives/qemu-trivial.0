Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOje7-0005Yc-Lu
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 10:03:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOje0-0005VT-4M
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOjdx-0003ZS-RA
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:03:32 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hOjdx-0003YH-LP
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 10:03:29 -0400
Received: by mail-wm1-f68.google.com with SMTP id y17so2481546wmj.0
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2019 07:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Yrhkeo/D1SWdn9V2cEE0ViA0DwIW0vyIKZvpuO7PeWY=;
	b=JMCBNAjcUFu9fkJhWcXiCZz967hPxeGgX5HtlZgK8vZPEryzQixMOn7/c09nXS2scB
	qstx4FD9EqJEEZhnEr6jvlnTXkCU8QJpO3xzrqirA8NOvN7eLIqwqlP4GSNNsEEAUkN7
	7M7AOJTMVqUhvKzLjYPIJf1WLh2vWas7JoFzW5gwfbAn0hk0jUsYIKCl+r1gYT2NUdNt
	80XIMtn22FvNTsQ2W/iTQW8ZYh/apLfnfo++A46mLx/GmXAkoMmKReuL7E962Y2mJJMT
	QWTa3m4Vs1ikmA5X9KtcUFdJKapytvn8iOw8MY7RdhzHIRBQYOZIn1f3RW5qMmm3ChqI
	ud6A==
X-Gm-Message-State: APjAAAXIrkZQOo28QWyfHLgCxBTx8iOSMNJxaQPef21oxMyBhg6wJPhK
	0jFKRtdLoDOQQybrOcKvAv/iKw==
X-Google-Smtp-Source: APXvYqwDk+n3XwhZCsKh1ANuo9jWXryjM+Vxg935rpH+KLGIRVRIODVkxo97wjcLdmILS3CDRDY5kg==
X-Received: by 2002:a1c:eb18:: with SMTP id j24mr3271666wmh.32.1557410608505; 
	Thu, 09 May 2019 07:03:28 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151])
	by smtp.gmail.com with ESMTPSA id m6sm3121799wmc.32.2019.05.09.07.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 07:03:27 -0700 (PDT)
Date: Thu, 9 May 2019 16:03:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Message-ID: <20190509140325.dbdhybz67u7smhrq@steredhat>
References: <20190508075527.32164-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508075527.32164-1-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tests/Makefile: Remove
 unused test-obj-y variable
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
X-List-Received-Date: Thu, 09 May 2019 14:03:38 -0000

On Wed, May 08, 2019 at 09:55:27AM +0200, Thomas Huth wrote:
> I recently noticed that test-obj-y contains a file called
> tests/check-block-qtest.o which simply does not belong to any .c
> file and thus wondered why this is not causing any trouble. It is
> only used to add -Itests to the command line (which refers to the
> build directory). However, it is not needed because "-iquote $(@D)"
> already sets this up in rules.mak. Thus we can simply remove this
> variable.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Fixed patch description with the information that Paolo provided.
> 
>  tests/Makefile.include | 19 -------------------
>  1 file changed, 19 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

