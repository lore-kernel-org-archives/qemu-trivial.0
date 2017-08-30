Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dn4Su-0003vM-MK
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 10:59:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dn4So-0003pr-1g
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dn4Sn-0003sC-Co
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:59:30 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:33590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dn4Sn-0003ra-5d
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:59:29 -0400
Received: by mail-wr0-x232.google.com with SMTP id k94so19312626wrc.0
	for <qemu-trivial@nongnu.org>; Wed, 30 Aug 2017 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=29PJUV4JWxbuxmdC2rrWSkNy5lGJgN5ywIOzbgbl2ig=;
	b=VW87E4e60N3wrt+LMOOMF9yJyyt0+R5acU2CrtD4QwMKHuMdrfIEE1Wm4b68u8bIzU
	HovbntMGURBT+hFt/9AcaOlIRwYs2qo1hz7+jRccjP2EMmNXamRYVuN7YhYRFuSFKb4b
	PA9yG0zguhU4vFt3NRHXoV/5HvwSi1N1oCh9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=29PJUV4JWxbuxmdC2rrWSkNy5lGJgN5ywIOzbgbl2ig=;
	b=lMz5GrDn0L/Soh0WGej9jVMiZws0Gn2157xLsnS0Z1//uOszghHYP9WILRWxx0HM60
	vLJ3LdtVs92HXLrjl3iGDgH8QhKuoFh9tWJ2JxsUvIEjJFuXX1vaKDwFZCw111ICRTxc
	viZVO1mB1cos8LQh1PD7PL2M0xPKNmR87JF06N7h/AeybxbqbPGRX64hRsoQ954xKNsz
	TJCbL3seYgPTKy4M1Qg8CHSA2ccwhqLmutcxFTQwiks9W9Cabqt0vkBwdmllCgrDJ+1S
	EC51/UkEs50YEU/oklU2FbeAa9ppLx+IQlF/uoeDoeX58i3ECYMawP4oIYQYc9APQCcQ
	Uorg==
X-Gm-Message-State: AHYfb5hjwG1RhPiuDmCsw0wPbnyQvx8AML6IApXS3Q1atwzhSP0xVBhR
	Ogbgzebmmhyc02PMKJSR7+WKuYMd+gV0
X-Received: by 10.223.132.98 with SMTP id 89mr1138193wrf.97.1504105167931;
	Wed, 30 Aug 2017 07:59:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Wed, 30 Aug 2017 07:59:07 -0700 (PDT)
In-Reply-To: <b98a4c56-f386-f827-5aa7-9a00e6fdf790@amsat.org>
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
	<b98a4c56-f386-f827-5aa7-9a00e6fdf790@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Aug 2017 15:59:07 +0100
Message-ID: <CAFEAcA8O5T5cX8XqBVZqXLt5MPvF7qEcJK8Az2GBei07P0dZGQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] hw/misc/ivshmem:
 Fix ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Wed, 30 Aug 2017 14:59:36 -0000

On 30 August 2017 at 15:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> On 08/30/2017 10:39 AM, Thomas Huth wrote:
>> The problem is that the server side code in ivshmem_server_send_one_msg(=
)
>> correctly translates all messages IDs into little endian 64-bit values,
>> but the client side code in the ivshmem_recv_msg() function does not swa=
p
>> the byte order back. Fix it by passing the value through le64_to_cpu().
>
>
> Yes, we lack BE testing :(

My pre-pull-request test set includes s390 and ppc64 bigendian.
This one was just missed because the 'slow' tests aren't in
'make check'.

thanks
-- PMM

