Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomjs-0007eS-Ji
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 05:05:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomjo-0007dJ-MF
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:04:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomjm-000716-Bx
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:04:56 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:48489)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gomjf-0006ue-5i; Wed, 30 Jan 2019 05:04:47 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MLRI3-1gXOL43HbX-00IU4O; Wed, 30 Jan 2019 11:04:34 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, cohuck@redhat.com
References: <1548769067-20792-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <50d1cba5-c759-9dd4-af28-52893d7b7e26@vivier.eu>
Date: Wed, 30 Jan 2019 11:04:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1548769067-20792-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:sAX0549SfX6OFD6vddnlMgrZjkx1eOeNGJCMc7FYYP8bRT7vhNN
	M7iZXDkKgkL0ZHVrmFhu6OdlMQcDBXOcqN6G2uRxDO6CJ82b8QOFDf9jyUrxhFFuONS7tiH
	UGaAd9/0vaxK1AEIJEXusfVW7FNN/XFyPrSPkPBIuuwWvw54CRwZR2IFhCigIoqVIStMjIM
	hC7m111agegk/GF2YZsKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fhipr+mEMQ0=:fiZ+UNhcEpt6Z/SGJzWyTM
	BYVBglIINfZR7B8cphHfQUHtvEutMvN70a6N0GC2mAjFJ40CixBd3X9RvQ32xX87p0H1m7Zs7
	KBSDAOxMGk4q7YnrV3IT1lI/moWsWCnrI2o47PqdZGw78tOp9dc2rB0HzZ6jPqim1H/gMud73
	j7mJRZvbdk0FEppdytzBSJhEy+214CWZ5D+iv/gRwfMtI832uiSkvg2Kat+Wra11k6BpZFT6W
	mJEekWqt1OhdWosm8SwzTlx7M6TnidISvPYZwqkr077SYsd360+81k20SVC5PE5ZCcK5sDe7o
	WZnqeCOSnAuhwKJzdtVWyFeTfzV0ZS0pPyFsOvMF9KF25ayDQZO/m0kSjAU+01zlN9kpf7VMD
	KnRfCp1X+vfbaKSrjTUyu8kvik/1BJmsnwx8wIp+OKrJW2fZUbuj2tPubLNJ6ipwLldvGPv5N
	19VmGzS+tbYB+z7erMi8VLcnpnEIAADPVVvjctPyTtJ4s6EfYCy6sOaxRuuBqPyDc2tt20xOK
	vn7Y7Rf5SHv09ka/O97pu5WnWBTgRS47yGU3xBpvCIWWzbeUZc/8tA6+/K18RLCsTuLeCWpU+
	1WqZNCdRdoL7Iv1TM4DfLcYdiX6EXCPFz2MsKy1QAeAY2At/QQE55keI1r3X8s/ECUq//mTyl
	yCQqwFahSwqPxz+fmZXvSHpnIkTh3NLPatHWmBZ6z295IkLyyKvwWEhK14VVga6VpuiNRcIdf
	8bovM/Nt+RCMSuliQg6QAlAxz9kNFhrspUiRirRZo1v5XMj99pN/hSpg2Rg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH] target/s390x: Fix LGPL version in the
 file header comments
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
X-List-Received-Date: Wed, 30 Jan 2019 10:04:59 -0000

On 29/01/2019 14:37, Thomas Huth wrote:
> It's either "GNU *Library* General Public License version 2" or
> "GNU Lesser General Public License version *2.1*", but there was
> no "version 2.0" of the "Lesser" license. So assume that version
> 2.1 is meant here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/s390x/cc_helper.c   | 2 +-
>  target/s390x/excp_helper.c | 2 +-
>  target/s390x/fpu_helper.c  | 2 +-
>  target/s390x/gdbstub.c     | 2 +-
>  target/s390x/helper.c      | 2 +-
>  target/s390x/int_helper.c  | 2 +-
>  target/s390x/mem_helper.c  | 2 +-
>  target/s390x/misc_helper.c | 2 +-
>  target/s390x/translate.c   | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
> index 5d91e45..307ad61 100644
> --- a/target/s390x/cc_helper.c
> +++ b/target/s390x/cc_helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index 2a33222..a758649 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/s390x/fpu_helper.c b/target/s390x/fpu_helper.c
> index 1b662d2..e921172 100644
> --- a/target/s390x/fpu_helper.c
> +++ b/target/s390x/fpu_helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
> index b8c81da..df14759 100644
> --- a/target/s390x/gdbstub.c
> +++ b/target/s390x/gdbstub.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index 2546316..3d74836 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/s390x/int_helper.c b/target/s390x/int_helper.c
> index abf77a9..abbbc20 100644
> --- a/target/s390x/int_helper.c
> +++ b/target/s390x/int_helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index 490c43e..a506d9e 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
> index 3f91579..52262f6 100644
> --- a/target/s390x/misc_helper.c
> +++ b/target/s390x/misc_helper.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index b5bd56b..6249c70 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

