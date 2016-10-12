Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buLRq-0008DS-LZ
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 11:28:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buLRn-0008BV-6E
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 11:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buLRl-00065i-7s
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 11:27:58 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buLRl-00065V-1R
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 11:27:57 -0400
Received: by mail-vk0-x231.google.com with SMTP id 192so48359655vkl.2
	for <qemu-trivial@nongnu.org>; Wed, 12 Oct 2016 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2w78aBKD4WzY7+FvyItUW2CmWY44qB5vYe+YWHY8fcs=;
	b=ZwbqFfCOItki/VtSm8TZKMy0GRVGS5KL/Q1u7N5ETl7/XUJhCjHwEzUA8lCBBQrev9
	lFWeNsHzojJYQXQJnKihn9vIQUpyj3RZjmy6piAh0AaUepMEJqLFRsA/LbQ5MQOO5k7W
	KUprXDAPF0y/sdznkgjcXLLcjIzuUPml8j27A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2w78aBKD4WzY7+FvyItUW2CmWY44qB5vYe+YWHY8fcs=;
	b=VFr/KF9gLCWF8cfIWn8ml5GGpRo8BswzU/xG4JufSKedeeLYQ49pprJAzmjDJq/v6t
	Hc9NLiFGULzI0AqmIvs00nqR1TqzQ8pOQDa515R67Uvik/19LMwcCbbSXsBs9GxJl/IK
	RoCDj98DHkjk+Rc1jLKYbRfUZQbu7jq1IhSEcdGWvU4K29zvzitXMSwPfHyxZLus200y
	xOF+kKn4G9eiHiMrLRROqoklwKqmWDo9r7q8QeOBj+woW+CEwLQDmGbwGNhYtOS0kVyD
	JJP39IkljoUcBXi4bkULYGAA7qk/ouWt5GWzKILcGCAav5KjEersxIzFWc4awLFtz7Lv
	ArCg==
X-Gm-Message-State: AA6/9RlGsX2koUbwWT52pMzR06lsj1Y8X1twDpQYPQ4uBjWq/l4aqnNTzdDJ+oGCukGwD9WcTHo3kVfEUZjZoqPm
X-Received: by 10.31.65.195 with SMTP id o186mr788581vka.3.1476286076258; Wed,
	12 Oct 2016 08:27:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 08:27:35 -0700 (PDT)
In-Reply-To: <1476285520-1985-1-git-send-email-thuth@redhat.com>
References: <1476285520-1985-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 16:27:35 +0100
Message-ID: <CAFEAcA9A-=p1Y4EtKW4adncxPaArvXV4Upwrq=iqGFNmCD5LMA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Keith Busch <keith.busch@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/block/nvme: Simplify
 if-statements a little bit
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
X-List-Received-Date: Wed, 12 Oct 2016 15:28:01 -0000

On 12 October 2016 at 16:18, Thomas Huth <thuth@redhat.com> wrote:
> The condition  '!A || (A && B)' is equivalent to '!A || B'.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1464611
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/block/nvme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index cef3bb4..53d9d2e 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -373,7 +373,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd *cmd)
>      if (!cqid || nvme_check_cqid(n, cqid)) {
>          return NVME_INVALID_CQID | NVME_DNR;
>      }
> -    if (!sqid || (sqid && !nvme_check_sqid(n, sqid))) {
> +    if (!sqid || !nvme_check_sqid(n, sqid)) {
>          return NVME_INVALID_QID | NVME_DNR;
>      }
>      if (!qsize || qsize > NVME_CAP_MQES(n->bar.cap)) {
> @@ -447,7 +447,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
>      uint16_t qflags = le16_to_cpu(c->cq_flags);
>      uint64_t prp1 = le64_to_cpu(c->prp1);
>
> -    if (!cqid || (cqid && !nvme_check_cqid(n, cqid))) {
> +    if (!cqid || !nvme_check_cqid(n, cqid)) {
>          return NVME_INVALID_CQID | NVME_DNR;
>      }
>      if (!qsize || qsize > NVME_CAP_MQES(n->bar.cap)) {

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

