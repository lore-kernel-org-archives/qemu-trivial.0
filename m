Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXSfn-0005zD-CM
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 09:36:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSfl-0005yp-6i
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 09:36:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSfk-0004QB-Dl
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 09:36:21 -0400
Received: from mail-io0-x231.google.com ([2607:f8b0:4001:c06::231]:34898)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSfk-0004Q0-77; Tue, 18 Jul 2017 09:36:20 -0400
Received: by mail-io0-x231.google.com with SMTP id k71so13346741iod.2;
	Tue, 18 Jul 2017 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=fzz7uDV1udxdbEK9IQ85V7z25dXR9Q0tSaE08eK7Hv4=;
	b=HmQlFergd02TxOuZRLjXaYEGDBifkytSdLn1N+rZS9loUYkqQqa3UYHtQXRoD1+Zmc
	6UoawMHCO1z0f3xgYygelAuG295zuLg29zRkOIow45JRNTzgoOOWQtcExPHXEV3gSQYx
	xzeswkH70z80EDqes/XsE8o7zSOreK/aemJ2BBjo1NAuaIZfaMRfJX8eM5a6hzTa6+tq
	K+x/ACyYaQUzTZNWdkTqdx31K8cgEQTL1ZSW5n2ypbLRqAI2Ymdb+SpvCvspqRXr9SuN
	J7rFodzIulqqapg6J3idtr1RqhsYYPetdOfvsFhjxm6b2rme1XvnzXq1OwV8vlC3D2xv
	mNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=fzz7uDV1udxdbEK9IQ85V7z25dXR9Q0tSaE08eK7Hv4=;
	b=Ll80Hjhh/zrDd6jJYrnCbEtyib5miwnIv8BNbPOJtGNyaEKxaL0WWDM0biBGpRYe0P
	l55Vlyl7ZoLJqbMwExA+0Ge5d/7JVHpqN1cSM2kpFkxZ5IwdlTXeFavNYmrruYdUYKvr
	NuMbJBXWqZubbO6OKRCnQ9Vk6J8Jm3L2dgkWIfwUG10xojBtf6ESAoW6efHTL9x+aZia
	v8SHJor1h37V6cTBURc+u84OpygxcddMR7TyjR0cug3HJpqrcP2P3N3COGD09TP9KXvK
	qAhrLfgs9/vkJaaR4xAVdL1AlBl1KpDPhm56NbjkcKo369Xlzwifla0JlWNvRPrxHPOz
	+gzQ==
X-Gm-Message-State: AIVw111cqR6JBKNt9W9den5GtbC9LNQIjXXjklW9v+L+QL997+U3wgG5
	UwKp68m7DodQWG2KOJOr7yaCtSupEw==
X-Received: by 10.107.200.211 with SMTP id y202mr1728200iof.16.1500384979084; 
	Tue, 18 Jul 2017 06:36:19 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.107.152.16 with HTTP; Tue, 18 Jul 2017 06:36:18 -0700 (PDT)
In-Reply-To: <4819b5c5-7ff9-dd32-d6c7-7516e8fb75fe@redhat.com>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-26-f4bug@amsat.org>
	<4819b5c5-7ff9-dd32-d6c7-7516e8fb75fe@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 18 Jul 2017 10:36:18 -0300
X-Google-Sender-Auth: YCcF5MtUGPU1KsC348bL6md-PPc
Message-ID: <CAAdtpL6tGcxMt4dbaULNtOC3jakyHhJYTpWaWghS2YA7i1=kRg@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::231
Subject: Re: [Qemu-trivial] [PATCH 25/29] libqos: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 13:36:22 -0000

On Tue, Jul 18, 2017 at 8:58 AM, Laurent Vivier <lvivier@redhat.com> wrote:
> On 18/07/2017 08:10, Philippe Mathieu-Daud=C3=A9 wrote:
[...]
>
> The title doesn't reflect the real change.

Good catch ;) too much rebase...

>
> otherwise:
>
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>

Thanks!

>
> Laurent

