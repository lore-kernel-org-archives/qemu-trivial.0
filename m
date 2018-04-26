Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBdcN-00056P-9n
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 05:55:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fBdcF-00050K-Tj
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 05:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fBdcE-0003ZF-V9
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 05:55:03 -0400
Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a]:33243)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fBdcE-0003YE-RK
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 05:55:02 -0400
Received: by mail-oi0-x22a.google.com with SMTP id 126-v6so23545411oig.0
	for <qemu-trivial@nongnu.org>; Thu, 26 Apr 2018 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w++tc4Z9ptWr57zQNMSJ35zoDzl58z71U9vOqP/bozc=;
	b=fNYGPyXBmSigML3df6TbXzVaLdscweI//7fMhm40EAWnEML5PPuAxVGDPEJPgbFwNW
	jvsZ7lYtvp7FgP5rxaKR++OVM89I4qAwvS+NquK00GoBT33SrmjXoacFLdG25SHndc2M
	Yz7vk43ZKfErgbIKFxaxOf2s45R4rq9uno/xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w++tc4Z9ptWr57zQNMSJ35zoDzl58z71U9vOqP/bozc=;
	b=X44f/mcRnlqbuQXduSZeSA8CxEnanOGiv+TQesTl7Y/w3BiECE4WyqcG1VZ7ck/AtF
	Hzmkr8ByXnsjU/PgGlbTXtbx+fvlt7lv4YakFivBdu14AjDjOlgClwZ9t/rogithQSST
	X7K0HqbID0qcTKK2ovmbDPcVi7ZnlD68ct1di6hn6qUdt2dfsHE7rD2ventZ7eoV4D71
	QWUMMk1XGmd7i4SZaxZernppwdaQt9V3qN4UhbWs473YUs47pgwfXPGWq8jMlZvn8ZJU
	qSU60trhQfhcpUcgLLiBkI6suDeWZOajYqvPJ71iE9+YHeoBzPWA3QeRLpXMX+lVopdj
	lVGg==
X-Gm-Message-State: ALQs6tDSHVgMkqROb2NKbdH4eeAfC2Ou8N/frPbSulMYYUktwqcOC48O
	9bONUk0cDSwvDs9ETG5HWOP8lravhY6NL0IW/b2+EA==
X-Google-Smtp-Source: AB8JxZqz5W6/lGl2/gDWAHSI8teK9V9Qu4RzdDTJ71940vK8T+c/Ttb6kHokexy/RhUKv0bmYifmH9Dyy/GUlBrrFOI=
X-Received: by 2002:aca:cd0b:: with SMTP id
	d11-v6mr3410138oig.337.1524736501847; 
	Thu, 26 Apr 2018 02:55:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 26 Apr 2018 02:54:41
	-0700 (PDT)
In-Reply-To: <91e6dbdd-6086-7c60-4bc9-a6ace1d041fc@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
	<20180418144433.GV27579@redhat.com>
	<CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
	<91e6dbdd-6086-7c60-4bc9-a6ace1d041fc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Apr 2018 10:54:41 +0100
Message-ID: <CAFEAcA9jr3t4zAdB+HraNOaA+EN0b8x9jitwNGv2U880EC7T1A@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Olaf Hering <olaf@aepfle.de>, Fam Zheng <famz@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22a
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
X-List-Received-Date: Thu, 26 Apr 2018 09:55:09 -0000

On 26 April 2018 at 10:19, Thomas Huth <thuth@redhat.com> wrote:
> On 26.04.2018 10:17, Peter Maydell wrote:
>> I've also upgraded Xcode, which means I now have a machine with
>> a clang that emits all the -Waddress-of-packed-member complaints.
>> I have configured the test build so those aren't fatal
>> (via --extra-cflags='-Werror -Wno-error=address-of-packed-member
>> -Wno-error=deprecated-declarations') but I'm now more interested in
>> getting those cleaned up so they don't clutter up my logfiles :-)
>
> Isn't the -Wno-error=address-of-packed-members flag added by Gerd's
> patch already? See:
>
> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=0e39c4aa7ecc5699bc391fcb

So it is -- I guess the compile failed because of the deprecation
warning, and I just assumed I needed to add both -Wno-error=
settings.

thanks
-- PMM

