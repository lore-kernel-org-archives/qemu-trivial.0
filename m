Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grOTC-0000qh-T7
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 09:46:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOTA-0000pU-Gl
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:46:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOT7-0000XE-5l
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:46:32 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:32849)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grOT5-0000Ti-Ez; Wed, 06 Feb 2019 09:46:28 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MCKO4-1gzbez3nQg-009Lpy; Wed, 06 Feb 2019 15:46:20 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>
References: <1549266858-5043-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
	WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
	SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
	UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
	Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
	JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
	q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
	RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
	8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
	LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
	dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
	CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
	ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
	HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
	rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
	jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
	NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
	WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
	lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
	BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
	gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
	+bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
	rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
	92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
	wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
	ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
	d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
	38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
	tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
	inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
	8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
	VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
	US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
	w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
	FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
	hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
	ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
	ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
	OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
	JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
	ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <c05e38ac-0f28-c968-42e2-d8e748325af0@vivier.eu>
Date: Wed, 6 Feb 2019 15:46:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1549266858-5043-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:AfXWiYXXmyG8eXcP1KFADYd7BuGKwSIBrRTJ85TPFR9+1MwqGrr
	IfPfCcmFmAAATled0Lu2nK28Xa4Y9JkRKQiUfcA00JVcpOF/W2KoDZFdKiuRGG6twDCiQRs
	no/+tSAU5K+RLRuve9ew0DCwwIEe4FPiLHHDE71Eq1Y3NW/O8sGzBugpgAAj8AjxExYVWai
	3AU+Hbcq5XIICExj6B3Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yd6Zm9Oi4iI=:TcPDVydh9TO7RtHwokcrUn
	7ZZM1BdKEJTXjg2XTodxFNAWSsN/UNJ9DTEOOZWI4XGAHvTOwmH0GQTF3J9skl7AqmajpMaBZ
	Nu+nNOQyIAz/jk4/9pT5AyoQOjb6tqR57tz6T25qTutKyu5MtnQWdbhlJuemXnIWbr/i0RGYE
	kx4Gi2ZJYZOcxLBiBqIjRMGgoer1Jn4X8iJQC8HixkCReCsI0mltsJocc5C40WfN0YlrWDqpV
	JQ7m971KGtEmWLDS/f564lzINfBgxtVAQp341eZeASxiQeSQW1+e74i07hoLo4qr9l5LEFSec
	8B6GVUgHDKr9t8lMdBWWZVAI8/5u9G4cbZWLHQUmM3e5UyUR6gVDXjZwElTUOcjhZ4RNddE2J
	/L9W0k8SPcTkmuV7N7BINIGMOynRTrkXAUiufFcaQbK3j17aTjWokg1jFB9lvPndVdYINGIoe
	DD0rywK178+iakFgS8F8ZrCII5bs+z+nJJwZLZJPiApY5KbKtDwyJwG82VNC0yZWi11ehuzWN
	FrmKWZJmyiQdbQZM7axGiLpn8gt9IcEs2qJ5sxYxzocYgJ2NYHnlUl5f0k+cVuIpiRUOCmcCF
	SpvpE4vPXZD1Nh+3ys1j6ZtQovFEtf5QKxhJoau0+/xwdWfip91J84zIxThB9YbBk9HfWv6Ci
	TbNmPj5UzDfklRCUMOfiFCCJiALgZeJqGpBgWdnZj/DwlTjpg84m1DDc5ZVSXWjSI/yf1rot9
	EVx93TFVtsdlfThZ0wm0KW9zjU7LsPNrW6LA0+QqsecR23RSX26bi2bvR3w=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [PATCH] target/moxie: Fix LGPL information in
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
X-List-Received-Date: Wed, 06 Feb 2019 14:46:33 -0000

On 04/02/2019 08:54, Thomas Huth wrote:
> It's either "GNU *Library* General Public License version 2" or "GNU
> Lesser General Public License version *2.1*", but there was no "version
> 2.0" of the "Lesser" license. So assume that version 2.1 is meant here.
> Also the files mentioned the GPL instead of the LGPL after declaring
> that the files are licensed under the LGPL, so change these spots to
> use LGPL, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/moxie/cpu.c       | 2 +-
>  target/moxie/cpu.h       | 4 ++--
>  target/moxie/helper.c    | 4 ++--
>  target/moxie/mmu.c       | 4 ++--
>  target/moxie/translate.c | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
> index 8d67eb6..46434e6 100644
> --- a/target/moxie/cpu.c
> +++ b/target/moxie/cpu.c
> @@ -13,7 +13,7 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>   * Lesser General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> + * You should have received a copy of the GNU Lesser General Public License
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
> index d40f1e6..080df4e 100644
> --- a/target/moxie/cpu.h
> +++ b/target/moxie/cpu.h
> @@ -6,14 +6,14 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>   * Lesser General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> + * You should have received a copy of the GNU Lesser General Public License
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> diff --git a/target/moxie/helper.c b/target/moxie/helper.c
> index 5b1532b..f3d8ee7 100644
> --- a/target/moxie/helper.c
> +++ b/target/moxie/helper.c
> @@ -6,14 +6,14 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>   * Lesser General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> + * You should have received a copy of the GNU Lesser General Public License
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> diff --git a/target/moxie/mmu.c b/target/moxie/mmu.c
> index bd90b1e..87783a3 100644
> --- a/target/moxie/mmu.c
> +++ b/target/moxie/mmu.c
> @@ -6,14 +6,14 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>   * Lesser General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> + * You should have received a copy of the GNU Lesser General Public License
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> diff --git a/target/moxie/translate.c b/target/moxie/translate.c
> index 29da02b..68ca223 100644
> --- a/target/moxie/translate.c
> +++ b/target/moxie/translate.c
> @@ -5,7 +5,7 @@
>   *
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public License
> - * as published by the Free Software Foundation; either version 2 of
> + * as published by the Free Software Foundation; either version 2.1 of
>   * the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful, but
> @@ -13,7 +13,7 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>   * Lesser General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> + * You should have received a copy of the GNU Lesser General Public License
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

