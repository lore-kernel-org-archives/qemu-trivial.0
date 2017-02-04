Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ca1eD-0000XP-Cl
	for mharc-qemu-trivial@gnu.org; Sat, 04 Feb 2017 09:49:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ca1eB-0000WR-Kv
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2017 09:49:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ca1eA-0008IT-Uy
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2017 09:49:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1ca1e6-0008FJ-EX; Sat, 04 Feb 2017 09:48:58 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DF617F09D;
	Sat,  4 Feb 2017 14:48:58 +0000 (UTC)
Received: from localhost (ovpn-8-24.pek2.redhat.com [10.72.8.24])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v14EmunX029225; Sat, 4 Feb 2017 09:48:57 -0500
Date: Sat, 4 Feb 2017 22:48:54 +0800
From: Fam Zheng <famz@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>, patches@linaro.org
Message-ID: <20170204144854.GC15362@lemon>
References: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 04 Feb 2017 14:48:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] CODING_STYLE: Mention
 preferred comment form
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
X-List-Received-Date: Sat, 04 Feb 2017 14:49:04 -0000

On Fri, 02/03 17:58, Peter Maydell wrote:
> Our defacto coding style strongly prefers /* */ style comments
> over the single-line // style, and checkpatch enforces this,
> but we don't actually document this. Mention it in CODING_STYLE.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  CODING_STYLE | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index f53180b..2fa0c0b 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -116,3 +116,10 @@ if (a == 1) {
>  Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
>  Besides, good compilers already warn users when '==' is mis-typed as '=',
>  even when the constant is on the right.
> +
> +7. Comment style
> +
> +We use traditional C-style /* */ comments and avoid // comments.
> +
> +Rationale: The // form is valid in C99, so this is purely a matter of
> +consistency of style. The checkpatch script will warn you about this.

Reviewed-by: Fam Zheng <famz@redhat.com>

