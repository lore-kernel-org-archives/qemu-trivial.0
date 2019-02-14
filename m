Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDZx-0006JP-9p
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:45:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDZu-0006Gc-UN
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:45:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDZt-0004dz-JB
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:45:10 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49123)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDZl-0004HD-AM; Thu, 14 Feb 2019 04:45:03 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MiZkX-1hX7M90eOd-00fmwe; Thu, 14 Feb 2019 10:44:54 +0100
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
	<20190207193605.25676-3-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bc517c7e-88eb-c2f3-ae46-dd910d5b9e3d@vivier.eu>
Date: Thu, 14 Feb 2019 10:44:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190207193605.25676-3-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:zguK35p07K+8i21C1PXEEuVfU1mmdsV6VFkCiIx6D2mK4pCwkpu
	+bIHxn0TMQmjbEBXWVWB2lg3Rqb88r01XOdyouKp+9esDURLlRmjt6Z4oqDoe5AgYjvhZzr
	CulXMcGxO3XTdxlKWKmoXiu48mqpjp4iCEaONkXYWfja86R1uNUltWPWd3L8EiktKKDdS5Q
	1ckJbaltcUqKQOwV8cQ1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BHNBx3Gfa5Y=:vFyg7tJu5txlQd/YXzt/w+
	VlvAWXOS3O/jotg2+alchXn0+LV6mtjn7/VIIautkrtVEuigzRLy1xnjzgLprfjbvd9qof/Pz
	kAgBO4P2RZkvYA4WPdZr+TylE49+U5NstDdATOItLxuy3ux/C1qYcTGxPXtsCYESMehjMpXvJ
	1Sz4+yZ2S7bCHgBNxH7eiCgGjU5dhe0mNzoHdyux8wdM7Y1eKi1JVdcGIJdOxxgxMOi8iYAac
	8jPK2c4jakT1wv+ois7I8wf3IyluvhxxD6KHRGtyqV5F6XqtUMW0j+6SJULw4NEQ3Rv4vw7gh
	oxvnKwkwi1LhevS2CcV457Mg+aOC8WvzT1TdePRFtPn0DwPvdbQ/2OcNStClDA3w94ZCbzSwu
	e2RFdjIRD5ORoCXZmnkM2oDoL64WGj86qz+VsqTc9FtiZuyMmZuCMIF1zExzqKt4wj2K1SwkA
	J51JhuB47YEj72Gyy5ctDVhhr5OVdQgQowdJ2OvFrVNcEZnPHoBcigMfvshItoeXf5dOz5NGz
	EmFJxSA6W8ykz9fJarDai2FD5vJHniK2KXWmXsTOZ7VR1oQm2HNkd2xH18Ks3ZFTrCgVVpoHV
	fOWuRSRjJMGapfWDir9K6/YRzua4y1bfJyLTtfQxQNTBjWs6UtLQG7tuzf7h7axklbFQAttH3
	7TT0TqElZi6KItHfhHbnnNO3JYOeIKCb8j3Igm13foyJoFCJ7DnCspLVQNek2SDk0bSp3jevi
	bLGyOhd8tuMEGsSVyj/SUiiozZIaNnqN+VYJ7lAOAEzl0SDsIsIg2Vu/ECQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH 2/4] configure: fix qemu-img name
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
X-List-Received-Date: Thu, 14 Feb 2019 09:45:12 -0000

On 07/02/2019 20:36, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index ff55e2273e..c8fc1647fe 100755
> --- a/configure
> +++ b/configure
> @@ -1768,7 +1768,7 @@ disabled with --disable-FEATURE, default is enabled if available:
>    virglrenderer   virgl rendering support
>    xfsctl          xfsctl support
>    qom-cast-debug  cast debugging support
> -  tools           build qemu-io, qemu-nbd and qemu-image tools
> +  tools           build qemu-io, qemu-nbd and qemu-img tools
>    vxhs            Veritas HyperScale vDisk backend support
>    bochs           bochs image format support
>    cloop           cloop image format support
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

