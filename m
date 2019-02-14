Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDcJ-0008Cx-Nq
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDcI-0008BP-02
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:47:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDcG-000188-BD
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:47:37 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:44463)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDcD-0000yg-SH; Thu, 14 Feb 2019 04:47:34 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Ml76o-1hLoed2ram-00lVD7; Thu, 14 Feb 2019 10:47:23 +0100
To: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org
Cc: asanchez@kryptoslogic.com, qemu-devel@nongnu.org, yu.ning@intel.com,
	pbonzini@redhat.com
References: <20190207233704.29978-1-n54@gmx.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9b42552a-b0b9-3786-3062-72e00d2ee7db@vivier.eu>
Date: Thu, 14 Feb 2019 10:47:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190207233704.29978-1-n54@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:S1Lhkq+QGqUwEMyknaeiGBgdjNG4GJUUejo7P2Njs2OGoTXPzpy
	BKu+3MgBMXmNSZ54TcOLS7P4xYpPOsG7N5q2kpmt1tPqbxNiR4cuIfQEU1XoZ9z9vYJGum6
	4Zhat9mUz7bBbC2MNSgr40klrL9zrItEaJNPsNlSKiLp2jyo8j84NfWpf1eKEsgtkkOWJDM
	NssduIhxVktAjlWvPE+KA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pvG1pWNoasA=:FJKhmsjYjeWNbfI/KeWHv/
	qViu7nQ5TRHfngvKNYFNXYMUl/HH79reOuDG2hQyCSCzRpMBm9ivi//Pnk3W3YIc05brUZCvo
	6EYRw3sGi/F/UWWQW/s3qaY/9YTHYqr0NSzfdw+rvyJy8+wcbVFujACuNQjXHwwYdXtiY6RDG
	QYOvx0iQYGNU5vmxo32p64xtZsGOyi7s1OZjC3VbCUpvc0XoqYL8TNNV8Fgn2Ea1ZZFn1+Pma
	g0GKUeLswFwguuXFIreiKIBxT6Du51D57o4qV+AZcS7reyg1I/jopx1r0ShMc5Wjeafo+aBTR
	Y6E60N9v56HhONas1IKjwIqq3WzaYAt6Fx0hbb7tIqO6B9m70K+vrgHsha11epW5k6uYb1aN2
	VG+0sZU/2/nRZXaLCx8dm6HFGpOqTRMwKvPa0uI4qdgmDUCEgbBM01yRBuSw3uUPG+vAVy9Nt
	RvuRR0mNzqFkq3fsiVzZY9Sse20ctZIx8Be1l9iEf1I98qRob7pbpKvXlj6EFxzQUjpntvVjw
	JdJqKBt+TVkUy05Nncs9ndBILuF0kJWVPmaGMvAAk3EabHW7U0F+zamP66JqRH/NMk4/LXdgi
	Kih+PKjdI1gO2YaH0tquSOvTBZ+9rBkyl8ls8P3O5fzGGimPAeXp2m2XP+1wwjhYgdXC6FcSK
	o4vtBZlFoCaA7j7x/fv6aaPWcUu4tQA8SEf6mfRwZB0YQxEqkcJNQ7FQzSEExP3XomRrbN+3K
	CvGxFUBSJTcbSP9mnhT8Lhr1jkubDsAZ1+sDhlOIusx4zf8MLpLyNSMBWqk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-trivial] [PATCH] configure: Add HAX support in NetBSD
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
X-List-Received-Date: Thu, 14 Feb 2019 09:47:38 -0000

On 08/02/2019 00:37, Kamil Rytarowski wrote:
> The NetBSD support in Intel HAXM has beem merged upstream and is functional.
> 
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index b18281c61f..89b889072d 100755
> --- a/configure
> +++ b/configure
> @@ -819,6 +819,7 @@ DragonFly)
>  ;;
>  NetBSD)
>    bsd="yes"
> +  hax="yes"
>    make="${MAKE-gmake}"
>    audio_drv_list="oss try-sdl"
>    audio_possible_drivers="oss sdl"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

