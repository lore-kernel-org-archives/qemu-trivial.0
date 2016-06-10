Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bBQZM-0006DI-DV
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jun 2016 13:50:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1bBQZJ-00069b-GR
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 13:50:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1bBQZI-0002z5-Kw
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 13:50:05 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1bBQZB-0002xz-Bx; Fri, 10 Jun 2016 13:49:57 -0400
Received: by mail-oi0-x242.google.com with SMTP id d132so14568896oig.3;
	Fri, 10 Jun 2016 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
	:cc:references:message-id:user-agent:subject:date;
	bh=loZu9TA7NZ7YjlTuQ52Y4ppgDpFQi3RUlBokLjFDP6o=;
	b=wUtuA7oqmLXxacAhzVPSc/wE0knI/0jJ0n6RMutGB8Qa1qACKjVpnMuB+2FybiFaCj
	/JGQCV7dwhwAw8Z+r5uv+wBxoEXPxTDIN2muJZFQZVldcSNcdez26GXeFOnsM7VvPO0Q
	spNbIEURop0AESeWpLD94djqapINxfOu73w5028o4gal470qUm45upOZNO0EmF93g7va
	1TuyK36tvchxDSu23eqtsaQjVQEjsqCzKuzmf994/O0TvCxbFrPzZmm0ZjE1F60fJS6m
	4d/7TKWTwXi5VwFFcX53RazqMOv1NwAVMPKtjcR6kjWOZRapY3GsuWA/rK8yQA9Y8R55
	9+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
	:from:in-reply-to:cc:references:message-id:user-agent:subject:date;
	bh=loZu9TA7NZ7YjlTuQ52Y4ppgDpFQi3RUlBokLjFDP6o=;
	b=WTimGUNbZPSQpaQ6CCo9JPBG9ryYaSFZpnOIiSsh1jjMS4wAHGjxQwINYepsX1DLs5
	0yeyxfR15zUM2sFG8NFSFshwnb5OfAZG3Mrd0ffVrjgkP1L+5JzvHpzDtzPL06nqUbns
	+sRjZszp9H3g2vrDHFrPvXRFalecK8vsxQ0V9U47Q/qK8JhnSL18clsPpDxH6Oopf/xu
	h3MD0if31LyLaBluV9axdpjCwZXHbcT/7W0Xkk+CVZVASsuANlX4hrmHwUXk2OZZzRe2
	MIR0Z2vo9kjT+WH8zs5mTrDf/5AVC0L5KYFj+0fzY925moYJDmpnk4x7OliiDvhE7HEv
	+tBw==
X-Gm-Message-State: ALyK8tIVQF06Y/l/mT79F5a18I7eoXy+QNz48D7y8WtM+Yb/k6A2vnvZguTr15HN1PcX9A==
X-Received: by 10.202.75.80 with SMTP id y77mr1968794oia.144.1465580996302;
	Fri, 10 Jun 2016 10:49:56 -0700 (PDT)
Received: from localhost ([172.56.15.253])
	by smtp.gmail.com with ESMTPSA id 65sm3090542otx.16.2016.06.10.10.49.54
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 10 Jun 2016 10:49:55 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <1465572354-3083-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org,  qemu-stable@nongnu.org
References: <1465572354-3083-1-git-send-email-thuth@redhat.com>
Message-ID: <20160610174740.665.66463@loki>
User-Agent: alot/0.3.6
Date: Fri, 10 Jun 2016 12:47:40 -0500
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [PATCH] configure: Rename CONFIG_QGA_NTDDDISK
 into CONFIG_QGA_NTDDSCSI
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
X-List-Received-Date: Fri, 10 Jun 2016 17:50:06 -0000

Quoting Thomas Huth (2016-06-10 10:25:54)
> There is no CONFIG_QGA_NTDDDISK define used anywhere in the QEMU
> sources. Looking at the changelog and qga/commands-win32.c, it
> seems like this should be called CONFIG_QGA_NTDDSCSI instead.
> =

> Signed-off-by: Thomas Huth <thuth@redhat.com>

Yikes, this does appear to be the case. Need to recheck the original
functionality since apparently it's been disabled ever since I added
this patch to the original series, but can take this in through my
tree.

Cc'ing qemu-stable

> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/configure b/configure
> index 8c2f90b..55019d6 100755
> --- a/configure
> +++ b/configure
> @@ -4965,7 +4965,7 @@ if test "$mingw32" =3D "yes" ; then
>      echo "WIN_SDK=3D\"$win_sdk\"" >> $config_host_mak
>    fi
>    if test "$guest_agent_ntddscsi" =3D "yes" ; then
> -    echo "CONFIG_QGA_NTDDDISK=3Dy" >> $config_host_mak
> +    echo "CONFIG_QGA_NTDDSCSI=3Dy" >> $config_host_mak
>    fi
>    if test "$guest_agent_msi" =3D "yes"; then
>      echo "QEMU_GA_MSI_ENABLED=3Dyes" >> $config_host_mak  =

> -- =

> 1.8.3.1
>=20

