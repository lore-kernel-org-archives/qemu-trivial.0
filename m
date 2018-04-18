Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8nA7-00049K-15
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 09:30:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8nA4-00047P-Ac
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:30:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8nA0-0005xs-BJ
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:30:12 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:36060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8nA0-0005xZ-6Q
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:30:08 -0400
Received: by mail-oi0-x229.google.com with SMTP id h11-v6so1568924oic.3
	for <qemu-trivial@nongnu.org>; Wed, 18 Apr 2018 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4McpK7oI61zUeYj0FNrkTh+hfTRH655hrLRa2V1xYIs=;
	b=QqsSIzbIAafSTr1lamPsKrQ7BlAfy0ElOw84aXTbCeJ3o9uXpwLUNxJ78SXPnoCTnM
	XaSIHxnFY+HiAlIw6pC5Be9UG7NlSggo/jgrrbMSsrfeSY/sj99ZJBd3PdHLBEsYaJ0f
	hdBTWXGXWY4f7ZShY3oqv1giHX7uN/LDIVV5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4McpK7oI61zUeYj0FNrkTh+hfTRH655hrLRa2V1xYIs=;
	b=YKAl1D+UhhfE3PKGR7bebuFw/MW1wHcT9+imHlB6NsTmwqTQj+9I15nKIE+rMWVlTN
	PFPNlRCWEPKvAtNnh6BGwaz9UVEk28u2vbCWqt+nuvynR1CCJcbznRABAM1W90Rxlpcr
	LTZvgVOhzAFkxSKKK8gwi1FildgvnK93gPTbh72NPs4nSOcxzauJaBvvl1rlVpP1i0bn
	GJVMovEbOGCtP+D4hohxZXVimVyINITwfYVMwdtsjTEy8/0fbeSTNPrIv32s0DWe/IVl
	QuqjYeoUECL4LVUszcH5IYvaoOE3TxInvIF18CcWsQHLKM16Yf20EKYgc1C08SZD1SYd
	Nl3A==
X-Gm-Message-State: ALQs6tDAYpjElBDIk9M5xA4zG1++8FkXmTTgzkGOjqueLWw5oa1+CkP6
	wpqloBvUNKyCb8YI2VELQn3VtwAiu7wRWzseUDAjpg==
X-Google-Smtp-Source: AIpwx4+EWUqdcrJavM04pcz8uRIeplQXpVc6A6s08WsmQTMSSMGJJ0Hx4eNqKCfpcdC/elCKUOUSbqWGTEydsEGjD6E=
X-Received: by 2002:aca:b3c1:: with SMTP id
	c184-v6mr1180896oif.12.1524058207452; 
	Wed, 18 Apr 2018 06:30:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Wed, 18 Apr 2018 06:29:47
	-0700 (PDT)
In-Reply-To: <20180418124753.GM27579@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Apr 2018 14:29:47 +0100
Message-ID: <CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Olaf Hering <olaf@aepfle.de>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Fam Zheng <famz@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Wed, 18 Apr 2018 13:30:13 -0000

On 18 April 2018 at 13:47, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
> On Wed, Apr 18, 2018 at 02:38:37PM +0200, Olaf Hering wrote:
>> Since usage of g_realloc_n was introduced, glib-2.22 can not be used any=
more.
>> Fixes commit 418026ca43 ("util: Introduce vfio helpers")
>
> Normally we expect ./include/glib-compat.h to be changed in this scenario
> to add compat for the missing symbol.
>
> IIRC, one of Peters desired build targets required 2.22, but I guess we
> missed this bug because that platform would not enable vfio functionality=
 ?

Yes, my OSX build system is on glib 2.22. It's using 'fink' for 3rd
party library installations, and they somehow seem to have got stuck
on 2.22. Looking at the website the project seems to have basically
stagnated, and I guess I need to move to homebrew at some point
(likely after we get 2.12 out the door). But for the moment this
patch would break my pullrequest testing builds.

thanks
-- PMM

