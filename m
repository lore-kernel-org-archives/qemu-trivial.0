Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRF40-00086v-IH
	for mharc-qemu-trivial@gnu.org; Tue, 19 Dec 2017 05:23:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eRF3y-00084Z-2Z
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 05:23:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eRF3x-0008VR-5S
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 05:23:54 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:41846)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1eRF3q-0008Rh-6S; Tue, 19 Dec 2017 05:23:46 -0500
Received: by mail-wr0-x242.google.com with SMTP id p69so9724061wrb.8;
	Tue, 19 Dec 2017 02:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fvDPYrrC3CRy0OYYLH6xzfN3UATLblSrptu/xxdQ6H8=;
	b=jlDNwzwY5kOVXEHrRIKtGv9wXKjtCkChrU2Y3Mxct6R9JPbvV4m5Zv357V+mSHVmt8
	ZFAoBiWKX4TYio/ylkKR155crMEhUV6CVg/mTCXPT47PRIb5ue8xl+436aWkippVbGbD
	+yZ8W9PvCWrs1ivJI6w/n367iJGGh8F4kTRMOlkhkCCGu612MOxRpML5u0vfvLuIOS+8
	bg6eGJACjbsT1jzDAlCF2lBKp39s4ewRQnXnL0CJV3+iLRDdapofGWgoxRKqVa4JOkp4
	l4X1cUal96y67oJ9D4ajx+D59fG4OMmzjn/OsRs9ZX/R/YvoqohiCyeWB16DT5jO+wcn
	/wIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fvDPYrrC3CRy0OYYLH6xzfN3UATLblSrptu/xxdQ6H8=;
	b=l0R9R/RsbyAgMZu8sVMjKmPe+k/uYPCkWhO9jpGfN8o1Gcxnbiv42LEueAEwRhZ0hN
	w1JShO1V1XvECsZN9f+LTkSNZxrcRQVr+X9o0Qh3gR8wU+TsywXVoNDHTgOt42iHLrlO
	q7ceCL0JCuYA/b9V1sJhdWKNL8SuU/aH/PSsChL63VX8KpMHwq4whGmNnNFhn0+0MVko
	bYlgu2KD7uWvUE/2IzZqWgMn0NmuFH9ceyDxsW2Bl/vSHpXKoM0wPCn0t2wTh+WfMPxa
	eRBFKswjEcjRPF+sFFRfvb0Vl87HSNmjUzalIGKX0QGb6v6Jp4oDQ4+sJeYDh2OC+4k4
	HQFQ==
X-Gm-Message-State: AKGB3mJQYmW4ufMQu28SkOViYqHumdCpXRy+U1wlap9uT3WmqK/jHq2Z
	vZ+wIepqs2bSsqgfLPHxb3Weqm1LEglYRmnC4clJ27kF
X-Google-Smtp-Source: ACJfBoug6U5W/kFtroiiI7mrnc3EWbUDXacsozKHJsk8tAUR67O36iY+gh7dZVgYm5OMO8+4+flLbv3oPPOTU2wASZw=
X-Received: by 10.223.158.13 with SMTP id u13mr4335952wre.134.1513679024676;
	Tue, 19 Dec 2017 02:23:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.165.153 with HTTP; Tue, 19 Dec 2017 02:23:43 -0800 (PST)
In-Reply-To: <20171219082518.19724-1-lma@suse.com>
References: <20171219082518.19724-1-lma@suse.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 19 Dec 2017 11:23:43 +0100
Message-ID: <CAJ+F1CL-ohuLUdDvLC5GPZOX81tUMSXo_LkwNWFw47UEJ9ivWA@mail.gmail.com>
To: Lin Ma <lma@suse.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build: Fix typo in
 scripts/git-submodule.sh
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
X-List-Received-Date: Tue, 19 Dec 2017 10:23:55 -0000

On Tue, Dec 19, 2017 at 9:25 AM, Lin Ma <lma@suse.com> wrote:
> Signed-off-by: Lin Ma <lma@suse.com>
> ---
>  scripts/git-submodule.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
> index bc7224a..807ca0b 100755
> --- a/scripts/git-submodule.sh
> +++ b/scripts/git-submodule.sh
> @@ -28,7 +28,7 @@ error() {
>      echo
>      echo "and then manually update submodules prior to running make, wit=
h:"
>      echo
> -    echo " $ scripts/git-sbumodule.sh update $modules"
> +    echo " $ scripts/git-submodule.sh update $modules"
>      echo
>      exit 1
>  }
> --
> 2.9.2


CC: trivial
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>
>



--=20
Marc-Andr=C3=A9 Lureau

