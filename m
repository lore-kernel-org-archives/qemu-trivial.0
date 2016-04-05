Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anSsR-0006K1-9n
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 11:26:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1anSsK-0006Is-BF
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 11:26:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1anSsE-0005I6-P5
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 11:26:40 -0400
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244]:34418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1anSsE-0005I0-JZ; Tue, 05 Apr 2016 11:26:34 -0400
Received: by mail-io0-x244.google.com with SMTP id z133so2827734iod.1;
	Tue, 05 Apr 2016 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=0CZisUEqmNjiLJDfMC/vdMmiOF4hln9Djjswfe2suD8=;
	b=xnIWnOzyav+CWlVI3bQAaFk3zyHIPRbuRcQV0nTXJszcF6qyvnpF3haVwiL600wS0c
	fiY+1grMd5e1loi2IW2HJOMffg5EInrY4C4wKag4Ws8a/ZAiidrRwrO/H08OdJFIPy5Q
	Emgb4sBONf4QS49vDdRgXaNTKAIhXV0sUYSi0AgIi0ggwIwZyJOS7dPM4Crl9ogT6Uzx
	B1BgE2PSIpUH0r8GT1ksFIdO71tNEletG4ccw6emm8bK1PyNFt/SuBB9VieUbL0OvnkH
	GJ0VuqJDNRfeaqQx32dSp1+nTqi7wt41Lleu4GtN5YtXgbG/VQg4WcnxSq+bvz7ZValf
	Ytrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=0CZisUEqmNjiLJDfMC/vdMmiOF4hln9Djjswfe2suD8=;
	b=derckKwmm+btNyLiSmPhL3YaLav63n2pMlYlXMgCmKPewlX0sjTFhIhjVEjkahK7GE
	ZaY6yAKVgQdgPnoTiSL/OCjD5napqkv/9bAQ/6zDU3iUS5Pe5T3X/hzLute1FQhvhgI9
	s2K4xoAK6U28ZisjVyZOKIQwHqBr9PZVKRc8hnOUJmcXVylhezv4CBBFWS5Qybq62x7S
	ZjI0RuiNBC3KhiQtl99Qacsmh03yDftI92zLATBa8N6WLgy6JP9TKUVxyEN1hwEZgeHP
	2BOiAEOu0Ny5VQ3I60/fKbzw9T1PCYDiFOWKEDXcTbLn6LwwHGsfGExqzuKaQXMloRXw
	EQaw==
X-Gm-Message-State: AD7BkJKJk7chBzlwcBy3byiCn89mL/JemYA/9U6mI9mo1wx2q8FB3tcmPitAKan3g4jeDxI+HY2mUzX3kzWisg==
X-Received: by 10.107.31.129 with SMTP id f123mr11629602iof.180.1459869994040; 
	Tue, 05 Apr 2016 08:26:34 -0700 (PDT)
MIME-Version: 1.0
Sender: carpeddiem@gmail.com
Received: by 10.107.39.66 with HTTP; Tue, 5 Apr 2016 08:26:14 -0700 (PDT)
In-Reply-To: <CAFEAcA8QuRvsuaG6Vx=baLZ6A=H2hZK3gR67tOHNOZw77dq=iA@mail.gmail.com>
References: <1459867593-72017-1-git-send-email-emaste@freebsd.org>
	<CAFEAcA8QuRvsuaG6Vx=baLZ6A=H2hZK3gR67tOHNOZw77dq=iA@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
Date: Tue, 5 Apr 2016 11:26:14 -0400
X-Google-Sender-Auth: a0s0UNxD_t-QNJ66GZ5qi2mh_HM
Message-ID: <CAPyFy2BdBxJLdEv8j-6wf5hsJq=2mpxkeht81CMXC4tWBv9qCg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::244
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bsd-user: Suppress gcc 4.x
 -Wpointer-sign (included in -Wall) warning
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2016 15:26:46 -0000

On 5 April 2016 at 10:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 5 April 2016 at 15:46, Ed Maste <emaste@freebsd.org> wrote:
>> This is the same change as b55266b5 in linux-user.
>>
>> Signed-off-by: Ed Maste <emaste@freebsd.org>
>
> Do you have many more of these bsd related patches to come?
> It might be easier to deal with them all in one patchseries...

I have nothing beyond these two. I caught the missing #include from a
build warning, but unfortunately didn't notice this (const char *)
difference vs linux-user when I mailed the first patch.

There are some warnings remaining in bsd-user still, but these should
be investigated after we sort out the bsd-user rework from Stacy Son
and Sean Bruno. I don't expect to have any further work until then.

