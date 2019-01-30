Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gommO-0000s8-5y
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 05:07:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gommL-0000pm-KO
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:07:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gommJ-0008C9-NV
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:07:33 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:41819)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gomm9-00087t-8h; Wed, 30 Jan 2019 05:07:21 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MEVJq-1gvtFw2iq2-00G4xU; Wed, 30 Jan 2019 11:07:06 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, liam.merwick@oracle.com
References: <1548769438-28942-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a726d274-800b-1529-f6ba-941e9a05fdfd@vivier.eu>
Date: Wed, 30 Jan 2019 11:07:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1548769438-28942-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:02hvWJ0KdRgWIujtRBK+T+dYfg3ZeF9skZ0m/Zb6pMciJ6/2S/T
	hCVC64Z8mjAvoKnnnMBxZ1SqV3p+/k8VFTH8bi+BLexrhZJ1ErrtTYq1QRQdKM0oXIPTwZS
	tDDWA92HKjEnVBpCSMf028VxXWUXglkBaAx8D4Dzm6enu9blnjVLDcuQNknjja8vyH1FKKS
	eiyWv/3hs8bB6rywWgLWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7fK7qe+y0FI=:XhtFD5iMoCZL9wZfg2HzY9
	usg1r+pSoyruWl0IeZGbvI21avNSbTqFflc5mAwURhFKitNLgW/nk/8ZEL/QXQXmh4JeFEPjx
	7Ku9Ml3ePrrtcFm1g4YxlXQFzc/Hr+72HPMbq/zsUXOBN9Q7ZdtePUEMjT+vbqCsvQX3ESDVi
	XzbzCPOF7eWSRh0US48aEoMbk5MpzkgLIUn+xOJ+kMtHqs6CYpE3no2bLzClROR6Iy/2znJwq
	6WKoBSeQSPYWo+iXxEj69hHmYX02rJiEMVbvn7I5wlO8mP0TMJVsfd2mdA6fMX9br3LsMYEzC
	YkdGm2fVCp0AmbHg+JfI9+s+4sO97lNjEE/3XurQu/+jU98MkrOmgUQd7qdNr5jarFd/El2sp
	TWG4gyw4rqyRLMcbUxg1SDKUlcsAmD/xkQMMDvjT4p1eoNlKCWNXsNXWGUEhkIDQw0xcqhSzF
	5R+V2EBj7/bHcfRZirTdf4V1bp8iJslHUaq0iio3EZLseOfvvQ8dXUarsGvF6OVeRcohJk5Mb
	bgdWD5du6zluqR22zR94hredjVfbzBPMKPXVbMVvGO4X32DU9klpMx9pKO+BTiDXkuYto1zK8
	gjS6qHvlvCMt1odUlGO7ZRdJfxQcDHgQrzjJhAI8gJP3fZDflKQIdFbanZgnx1vypn9ABoWOQ
	Qn/nV0JF9Cg47d+xI/207dOCX0vAHEZM44n0ShnI+4ogYvHZAazGhVZogABeCps9qXS09LAX2
	KUTHO5U0xvsW56ORAohA9NebeOhgJIQk8mlZ6CE/4VaoHKwGK7NtiLfyRnQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [PATCH v2] target/m68k: Fix LGPL information in
 the file headers
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
X-List-Received-Date: Wed, 30 Jan 2019 10:07:35 -0000

On 29/01/2019 14:43, Thomas Huth wrote:
> It's either "GNU *Library* General Public License version 2" or
> "GNU Lesser General Public License version *2.1*", but there was
> no "version 2.0" of the "Lesser" license. So assume that version
> 2.1 is meant here.
> Also some files mention the GPL instead of the LGPL after declaring
> that the files are licensed under the LGPL, so change these spots to
> use LGPL, too.
> 
> Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Fixed typos in the patch description
> 
>  linux-user/m68k/target_cpu.h     | 4 ++--
>  linux-user/m68k/target_structs.h | 2 +-
>  target/m68k/cpu.h                | 4 ++--
>  target/m68k/fpu_helper.c         | 4 ++--
>  target/m68k/gdbstub.c            | 2 +-
>  target/m68k/helper.c             | 4 ++--
>  target/m68k/op_helper.c          | 2 +-
>  target/m68k/translate.c          | 4 ++--
>  8 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/linux-user/m68k/target_cpu.h b/linux-user/m68k/target_cpu.h
> index 611df06..7a26f3c 100644
> --- a/linux-user/m68k/target_cpu.h
> +++ b/linux-user/m68k/target_cpu.h
> @@ -7,12 +7,12 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> + * Lesser General Public License for more details.
>   *
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> diff --git a/linux-user/m68k/target_structs.h b/linux-user/m68k/target_structs.h
> index a003676..e373d48 100644
> --- a/linux-user/m68k/target_structs.h
> +++ b/linux-user/m68k/target_structs.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index b288a38..f154565 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -7,12 +7,12 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> + * Lesser General Public License for more details.
>   *
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
> index 6eeffdf..b35489b 100644
> --- a/target/m68k/fpu_helper.c
> +++ b/target/m68k/fpu_helper.c
> @@ -7,12 +7,12 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> + * Lesser General Public License for more details.
>   *
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> diff --git a/target/m68k/gdbstub.c b/target/m68k/gdbstub.c
> index 99e5be8..fd2bb46 100644
> --- a/target/m68k/gdbstub.c
> +++ b/target/m68k/gdbstub.c
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index 917d46e..3e26d33 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -7,12 +7,12 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> + * Lesser General Public License for more details.
>   *
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 8d09ed9..76f4399 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 752e46e..6217a68 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -7,12 +7,12 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> + * Lesser General Public License for more details.
>   *
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

