Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TqZIP-0004n3-8S
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2013 20:08:33 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TqZIM-0004mm-S1
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 20:08:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TqZIL-0002Sb-RF
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 20:08:30 -0500
Received: from mail-la0-f46.google.com ([209.85.215.46]:61919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TqZIL-0002SL-JS
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 20:08:29 -0500
Received: by mail-la0-f46.google.com with SMTP id fq13so7116792lab.33
	for <qemu-trivial@nongnu.org>; Wed, 02 Jan 2013 17:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=REfhhEGXoalTktn6GIqQhj8+UIuzKU1NmMI6HDOP4Rs=;
	b=UaUanOen9CRBkFaXnhkgCebhC3E9T8HrYUjIC/CVyOPZUEMGvRZxKxy598WrBmRUOx
	YlX3N12z18jiItzBZlKuoyCtgCihLpwmHIELBayQfmZYH0XRlxkx6f1dpCf/AI7sAM0Y
	W08ob7Ni/r2vjHCqHuVY2TX/3O3Y6+UT80OnsLIaPUZ5xv9tfBYQ8VHlx4LDa/1vWjU9
	5BNJxEbwu+gg0JyZpFKehzI0A1kNyP9aDT3c3YGY3kd0uHl55UMW1VgdK7mBvVexSTIe
	UrI4rIrSwg0PRh835tCWRUrSW24ojJ/wvxyjGS9ZccpzixG1x7XcBtbmdTvBuynI7ADy
	xRhw==
Received: by 10.112.54.6 with SMTP id f6mr19510589lbp.71.1357175308017; Wed,
	02 Jan 2013 17:08:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.55.176 with HTTP; Wed, 2 Jan 2013 17:08:07 -0800 (PST)
In-Reply-To: <201301030019.r030JT4H029920@d01av04.pok.ibm.com>
References: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<201301030019.r030JT4H029920@d01av04.pok.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jan 2013 01:08:07 +0000
Message-ID: <CAFEAcA86669ssq+5y8BLL6CBdZozjwKWmdKkQG1m=pFSn_JPTQ@mail.gmail.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlTuEa7T/RJxNuAVOiqlXTKS58w1IEEveEBSqWe3iHOYfUaRsIRnGzVju8SMSTl86DxSG9o
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.46
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	liguang <lig.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] correct error message
	qemu-img reported
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
X-List-Received-Date: Thu, 03 Jan 2013 01:08:32 -0000

On 3 January 2013 00:19, Anthony Liguori <aliguori@us.ibm.com> wrote:
> This is an automated message generated from the QEMU Patches.
> Thank you for submitting this patch.  This patch no longer applies to qemu.git.

> Nacked-by: QEMU Patches <aliguori@us.ibm.com>

Are we going to get these emails on every old patch that was
superseded by a later fixed version 2?

-- PMM

