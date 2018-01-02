Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eWRDU-0004EJ-Qs
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jan 2018 13:23:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eWRDS-0004E3-P4
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 13:23:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eWRDQ-0007VH-36
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 13:23:10 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:62878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eWRDP-0007T0-Pt; Tue, 02 Jan 2018 13:23:08 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue003 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0Lvx61-1ezgvX3Aar-017pwQ; Tue, 02 Jan 2018 19:22:42 +0100
To: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1514910326-31234-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <684d262d-8966-b399-707a-f0d44cb91167@vivier.eu>
Date: Tue, 2 Jan 2018 19:22:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1514910326-31234-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:mXx9CyZ7CcISNtqYjOuos3Vg6LNH5feim3/ZZnyf5uEktKk0I+P
	vhktqvt3jnaGFQIAADJV7UFnan8bbD+2l6vQrQm+hdSVhpttscqunCxtpYw68/jBX0wnOmP
	t4PlIjbBH1v7e5VA6AmVtq0KankCBI9HHEIHQoA9lCU7rZW9PvpBhuq2DWj97oyxdPpbzdk
	zPBSUEkQmzvZGehZlJjhA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:VpY89pl5+68=:QFZMpKhpFofCTe2YTD+w6s
	MeNDiEadNU9ow/CRxwSnx+XS+K1yKrUfQP/jqlF0Be+6ZeG+WLFVMW24UAGP8eO5km79lRnHj
	CtO9YIQWV2fOv4LNqSa04aYszFNtvIlyPnve0SRk2byWOXX6YthccJbiKhuE8eKErbabv2jbG
	VHIqSPZsMV1h2d+HZxsgSOGbGpUNqaYSp3QNc/mHn/ylQ/c8iDGVqcrJ94zpWGIyxQ5QUeZNW
	NUgdZvi66SrUQ5QEQlyE0a4oOzb85/bT7Pvwytn/B24G6XES5CToUo9O7NHLB7Y21YJLW2OFC
	+4+yiBe4zW86xm/ZjIMOIRkQe09rV4I3U7PjPlXGEujaIYn0vjzHAQVLoBZMuq62HfUULYyNu
	FrKhd2E8n2cF8hoSv11wDtUex0ThkhW1QiBaSn5V5VoTkG52J9OBPltutDTGqEsReP1PwShrQ
	fRft29lVp8cy1ukPo9BX2IYx6NRah0+FbGG8HmDeFff8gYsEdxZ47PZSV0CJqmgvGW9rbeV4T
	Xj1GTByaA6SBZ/zfzG6M89LOQDTYyo4m+IXH3HyoM+Or46bUEwqO+UljKZ4b+S8eY1uRQ0OT3
	dDVjQq7j2snogEHVDwHAUqSLoK1pK43DST+24GFgIkRaow0Jr5fVd0tXwvhvzo4y+YJGDRzt+
	aDb8O92d8nzfMP8SwclPycJCz3qNduNKgQdHK71qS/7kPiX7BnVvaFSBZTjUGNFKamBkQQD06
	Hn5Y8BMc/fpDmX4+EyfDH2poMuVOdVD4qxqRyPACG6eUiUic7cJWdoSAOfcVd3HXiwZG+/rnn
	fMO9UB1MD81taZykUOckBQISWYfCJdP3tkOVnfgPJBMOGTHSAsJXD5edVhFlOUL1zf3NiW6LZ
	F8FgpfjksRmXtKQ6kBEqJAjmQurzfDYfGL2rGszCk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add qemu-binfmt-conf.sh
 script
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
X-List-Received-Date: Tue, 02 Jan 2018 18:23:11 -0000

Le 02/01/2018 à 17:25, Thomas Huth a écrit :
> qemu-binfmt-conf.sh is used for the Linux usermode emulation, so
> let's add this file to that section in the MAINTAINERS file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 73a5555..e92618f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1713,6 +1713,7 @@ R: Laurent Vivier <laurent@vivier.eu>
>  S: Maintained
>  F: linux-user/
>  F: default-configs/*-linux-user.mak
> +F: scripts/qemu-binfmt-conf.sh
>  
>  Tiny Code Generator (TCG)
>  -------------------------
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


