Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbvJu-00034v-TD
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 10:37:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbvJt-00034o-BT
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:37:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbvJr-0003Py-GM
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:37:33 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:40512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbvJr-0003Pn-Bt
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:37:31 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so3241720iej.4
	for <qemu-trivial@nongnu.org>; Fri, 23 Nov 2012 07:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=vRO+IGCOkv+8QEPg3Slyj2DFKl1t/EtZGALjY9jmNLU=;
	b=cQJovpDDzQr+JBvabRbqjDGRF0rbw4v9VZFGArgR7bG34ICWzP/SzOOQx8aCvTJTLz
	dytSgtN1HnceW8eLR1UeR141HE7HstAYs2DGIdr8EL4/vS/sJHdzoEIEU+xpGGI8lsAC
	CfI1hj/GgooILd51gCMdAua9V0B7cehru0omrSsK+E4G3UOsZR24/MyY4ebT5Xv0Wogn
	ZLvFXomoQFvhNprNAJOhWlMdNtNlX/gf7Gnb5H0yvCSY/+ibiqbWyz9ZXfyqFr/gGtL5
	ardSth719y2aKF7UgIoJVPrgHjaqSCgp4KAPRr4ojbZX1Gei4VKeCz8PRP2eel6vr06n
	kB/A==
MIME-Version: 1.0
Received: by 10.50.152.196 with SMTP id va4mr3961922igb.13.1353685050614; Fri,
	23 Nov 2012 07:37:30 -0800 (PST)
Received: by 10.50.45.103 with HTTP; Fri, 23 Nov 2012 07:37:30 -0800 (PST)
In-Reply-To: <CAFEAcA9AnUrbrOKrJx7pkg9j1Ex3Ou2d23ROsn82TJa4Wdrf_Q@mail.gmail.com>
References: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
	<50AF931B.8080707@redhat.com>
	<CAFEAcA9AnUrbrOKrJx7pkg9j1Ex3Ou2d23ROsn82TJa4Wdrf_Q@mail.gmail.com>
Date: Fri, 23 Nov 2012 15:37:30 +0000
Message-ID: <CAFEAcA_CxhYyGJzH886gEV21OU6yT6ejkmtOR=x8Nqva2YX7yA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkkE8LC1MFVGgWTmd4Cle0S3anYJ0QTwu8o/0WPASsRTKidf8eREHLP8Ua6bMdiw9bjadlE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org, qemu-devel@nongnu.org, Yurij Popov <oss@djphoenix.ru>
Subject: Re: [Qemu-trivial] [PATCH] qemu-timer: Don't use RDTSC on 386s and
	486s
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
X-List-Received-Date: Fri, 23 Nov 2012 15:37:34 -0000

On 23 November 2012 15:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 November 2012 15:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> You should at least test __i686__ too:
>>
>> $ gcc -m32 -dM -E -x c /dev/null |grep __i
>> #define __i686 1
>> #define __i686__ 1
>> #define __i386 1
>> #define __i386__ 1
>
> Yuck. I had assumed gcc would define everything from i386
> on up when building for later cores.

...and there's an enormous list of x86 cores too. This bites
us already -- if you use '-march=native' to get "best for my
cpu" then on a Core2, say, it will define __i386__ and __core2__
but not __i686__, so TCG won't use cmov :-(

Anybody got any good ideas for how to say "is this at least
a 586/686?" in a way that won't fail for any newly introduced
x86 core types?

-- PMM

