Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqK2n-0007Py-Ou
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 06:00:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqK2g-0007CG-Jw
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 06:00:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqK2b-00089x-QA
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 06:00:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1XqK2R-00084o-Ck; Mon, 17 Nov 2014 06:00:07 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAHAxhVh029033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 17 Nov 2014 05:59:44 -0500
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAHAxdib021508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 17 Nov 2014 05:59:41 -0500
Message-ID: <5469D51A.9010703@redhat.com>
Date: Mon, 17 Nov 2014 11:59:38 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org
References: <1416203854-11908-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1416203854-11908-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: edgar.iglesias@gmail.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] target-cris/translate.c: fix out of
	bounds read
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Nov 2014 11:00:28 -0000

On 17/11/2014 06:57, zhanghailiang wrote:
> In function t_gen_mov_TN_preg and t_gen_mov_preg_TN, The begin check about the
> validity of in-parameter 'r' is useless. We still access cpu_PR[r] in the
> follow code if it is invalid. Which will be an out-of-bounds read error.
> 
> Fix it by using assert() to ensure it is valid before using it.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  target-cris/translate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/target-cris/translate.c b/target-cris/translate.c
> index e37b04e..76406af 100644
> --- a/target-cris/translate.c
> +++ b/target-cris/translate.c
> @@ -169,9 +169,7 @@ static int preg_sizes[] = {
>  
>  static inline void t_gen_mov_TN_preg(TCGv tn, int r)
>  {
> -    if (r < 0 || r > 15) {
> -        fprintf(stderr, "wrong register read $p%d\n", r);
> -    }
> +    assert(r >= 0 && r <= 15);
>      if (r == PR_BZ || r == PR_WZ || r == PR_DZ) {
>          tcg_gen_mov_tl(tn, tcg_const_tl(0));
>      } else if (r == PR_VR) {
> @@ -182,9 +180,7 @@ static inline void t_gen_mov_TN_preg(TCGv tn, int r)
>  }
>  static inline void t_gen_mov_preg_TN(DisasContext *dc, int r, TCGv tn)
>  {
> -    if (r < 0 || r > 15) {
> -        fprintf(stderr, "wrong register write $p%d\n", r);
> -    }
> +    assert(r >= 0 && r <= 15);
>      if (r == PR_BZ || r == PR_WZ || r == PR_DZ) {
>          return;
>      } else if (r == PR_SRS) {
> 

Applied, thanks.

Paolo

