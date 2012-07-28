Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sv5xV-0006mj-8F
	for mharc-qemu-trivial@gnu.org; Sat, 28 Jul 2012 08:17:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Sv5xQ-0006Xg-8V
	for qemu-trivial@nongnu.org; Sat, 28 Jul 2012 08:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Sv5xP-0005EV-90
	for qemu-trivial@nongnu.org; Sat, 28 Jul 2012 08:17:20 -0400
Received: from mail-gg0-f173.google.com ([209.85.161.173]:52454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1Sv5xN-0005E7-Gx; Sat, 28 Jul 2012 08:17:17 -0400
Received: by ggnp1 with SMTP id p1so3812975ggn.4
	for <multiple recipients>; Sat, 28 Jul 2012 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=khOFRNqwWg/P2uTwolKwkSZzYtQ109gmju2fYlIdkxc=;
	b=Gt9uPYVKW1c118JQq0CVQoqbjEMftdNjxFWI1vsusp09V+O+sS0y34jPg5ulQhQi5c
	swGvKOzqWZiiS6JFceSkZhAFqIKS24wHtS+i3BLdFhlqhKsdc6hnciIF+UbwOt/A6bK7
	nJQuOX2GKIPcRU9IBa7eHzT2lTOu5J8iPu+CN2RtVTGb3CRKqeafUhyCtmzcWn/T7Ch/
	YF/VAZlsH8Y+LLxjisSCigOOPlAOBzcU3k0IOLyu8R7SQ2oUl31M9P9N6cJmPZwCJBIU
	62C+T01ScnIQ+Rv85b3TBGglRf90qtOU2BaSfQiXxU+94wLSLViWEWJnEOmWnNInougT
	T4rA==
Received: by 10.50.154.201 with SMTP id vq9mr6970906igb.2.1343477836338; Sat,
	28 Jul 2012 05:17:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.10 with HTTP; Sat, 28 Jul 2012 05:16:56 -0700 (PDT)
In-Reply-To: <1343139027-23659-1-git-send-email-peter.maydell@linaro.org>
References: <1343139027-23659-1-git-send-email-peter.maydell@linaro.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 28 Jul 2012 12:16:56 +0000
Message-ID: <CAAu8pHtznTEb2rnx9FSR=oEMu7AuMuoz+=uhzSWp7tRMwtKfVQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/escc: Drop duplicate definition of
	'disabled' property
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
X-List-Received-Date: Sat, 28 Jul 2012 12:17:23 -0000

Thanks, applied.

On Tue, Jul 24, 2012 at 2:10 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Drop a duplicate definition of the 'disabled' property from
> the escc qdev property list: this redefinition is currently
> effectively ignored but will become an error. (The duplication
> was inadvertently introduced in 2009 in commit ec02f7dec2.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Other than the armv7m_nvic, this is the only other case of an
> attempt to set a duplicate property that I could find in my
> "start every machine QEMU implements" test...
>
>  hw/escc.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/hw/escc.c b/hw/escc.c
> index 4d8a8e8..e1f5e73 100644
> --- a/hw/escc.c
> +++ b/hw/escc.c
> @@ -905,7 +905,6 @@ static Property escc_properties[] = {
>      DEFINE_PROP_UINT32("frequency", SerialState, frequency,   0),
>      DEFINE_PROP_UINT32("it_shift",  SerialState, it_shift,    0),
>      DEFINE_PROP_UINT32("disabled",  SerialState, disabled,    0),
> -    DEFINE_PROP_UINT32("disabled",  SerialState, disabled,    0),
>      DEFINE_PROP_UINT32("chnBtype",  SerialState, chn[0].type, 0),
>      DEFINE_PROP_UINT32("chnAtype",  SerialState, chn[1].type, 0),
>      DEFINE_PROP_CHR("chrB", SerialState, chn[0].chr),
> --
> 1.7.5.4
>

