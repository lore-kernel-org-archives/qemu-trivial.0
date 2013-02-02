Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U1jzP-00089s-Ao
	for mharc-qemu-trivial@gnu.org; Sat, 02 Feb 2013 15:47:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U1jzM-00089E-HO
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 15:47:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U1jzK-00086v-40
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 15:47:04 -0500
Received: from mail-lb0-f182.google.com ([209.85.217.182]:64174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U1jzJ-00086g-T6
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 15:47:02 -0500
Received: by mail-lb0-f182.google.com with SMTP id gg6so5628819lbb.13
	for <qemu-trivial@nongnu.org>; Sat, 02 Feb 2013 12:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=vWFf0f79dQ4lkAoUpavawzrMaP5g93G7O3QvH9/gNHQ=;
	b=aeasbk/Q/uJ62vKtkfOfeH8C+s9JNmqWtcpDGSYIvcyeCISkK1KMtCfzkXj4KSA4gG
	fm8tkcOnmTGo+n7JcJiR/VATuLWPBRGOXC1cXW8Cw5nKYeUh915NFDKXtorz1DsFzr1w
	voRNTqgROS2ZuZXrNFZnepl9lzXgTELwxj60Mgsqw94DyrhUCcuWTPybzP5juVoX6DnM
	olef1Cny/opJBTyMnDDPLrg08nkPfgEB0quEnvoQvRFv4n+5CIs6/08yDpAuKUjIegZn
	SdJtkqHu6gYjPNzpuJb3juf5uzwU6LiO+4QvAjCzSiIP4CHw7g7DgcMUsY82MczXAJjh
	0H2w==
X-Received: by 10.152.133.133 with SMTP id pc5mr14765404lab.32.1359838020628; 
	Sat, 02 Feb 2013 12:47:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.107.42 with HTTP; Sat, 2 Feb 2013 12:46:40 -0800 (PST)
In-Reply-To: <510D5C3E.3040500@web.de>
References: <1359825474-26661-1-git-send-email-peter.maydell@linaro.org>
	<510D5C3E.3040500@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Feb 2013 20:46:40 +0000
Message-ID: <CAFEAcA9=+OCo4sykv__zbXvezsSts9YR7qHeCwoouXEQstggNQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkwq603hdK+PTTlLm77C3Bp1AC/eUidrUorVcqYETgwP3REQqHwsqRQPnN+YG8tXeI30jYn
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.182
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] disas/i386.c: Add explicit braces round
	empty for-loop body
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
X-List-Received-Date: Sat, 02 Feb 2013 20:47:05 -0000

On 2 February 2013 18:34, Andreas F=C3=A4rber <andreas.faerber@web.de> wrot=
e:
> Am 02.02.2013 18:17, schrieb Peter Maydell:
>> This is the only clang warning on MacOSX apart from the ones about
>> deprecated features in audio/coreaudio.c and ui/cocoa.m

> On v10.5.8 I'm seeing some redundant declaration warnings from
> disas/s390.c and assumed we wouldn't want to fix/workaround the disas
> stuff. Same for some exynos4 file.
>
> Also some uninitialized buf2 in the Realtek NIC or so.

I don't see any of these with 10.6.8 (with either clang or
the Apple gcc). Do they appear to be legitimate warnings?

> And test-thread-pool breaks due to undefined ___sync_fetch_and_add and
> ___sync_val_compare_and_swap.

Hmm, I hadn't tried running make check. I see:
(a) tests randomly hang (possibly only if built with gcc? hmm)
(b) test-string-input-visitor(59002) malloc: *** error for object
0x12068: pointer being freed was not allocated
(c) test-thread-pool seems to hang
(d) make distclean doesn't delete the test executables in test/ :-)
(e) lots of format-security warnings from check-qjson.c:
tests/check-qjson.c:53:33: warning: format string is not a string
literal (potentially insecure) [-Wformat-security]
        obj =3D qobject_from_json(test_cases[i].encoded);
                                ^~~~~~~~~~~~~~~~~~~~~

I'll prod a bit further on (b) at least...

-- PMM

