Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SRoE4-0005SY-Jz
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2012 13:29:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SRoDy-00058T-Lh
	for qemu-trivial@nongnu.org; Tue, 08 May 2012 13:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SRoDt-000149-UT
	for qemu-trivial@nongnu.org; Tue, 08 May 2012 13:29:22 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36313)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SRoDt-00011O-Pj
	for qemu-trivial@nongnu.org; Tue, 08 May 2012 13:29:17 -0400
Received: by obbwd20 with SMTP id wd20so12116012obb.4
	for <qemu-trivial@nongnu.org>; Tue, 08 May 2012 10:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=salNgjN6MBNxzkpSKz1S9KiPBtBcjxoviFpWeOk/DUc=;
	b=jMpLe9f3lDCYvzDEPKJIBFy7oMuRsvF7cTDpV18fNFGxqiRUOWXV4oMbsF+3+X9c2y
	owSU5uXq3APdGa8KU4Mo1osC0xCMleAgMzbQmamvDmLqFzwIal8lqELjcWph/t1Jn6a3
	lp2irlDPVX+SV4M3i9nXnTTMLo0ebYIhAn+AKR9JzwAqjKioawIAEyVwE5zZzZSwDsOF
	eMI/IDCOi0l1tIB+k3PKPP0mvZYrvBuN6Z6giCBQap4I1SiwRvQzGCTpDOdp9b7AjCOy
	cE/vyARezRJkpItNfsdwPO9NbO9yTKFu6Zd7A0i55LfaMN95RjLtyCd6no5TTgL1yDQ6
	MVuA==
Received: by 10.182.111.7 with SMTP id ie7mr17417205obb.14.1336498156188;
	Tue, 08 May 2012 10:29:16 -0700 (PDT)
Received: from [70.123.136.102] (cpe-70-123-136-102.austin.res.rr.com.
	[70.123.136.102])
	by mx.google.com with ESMTPS id g4sm22412991obc.22.2012.05.08.10.29.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 10:29:15 -0700 (PDT)
Message-ID: <4FA957E9.9040308@codemonkey.ws>
Date: Tue, 08 May 2012 12:29:13 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1335990538-20025-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1335990538-20025-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Gm-Message-State: ALoCoQmuI90kjYh6OG1DzlRNgWWr+dtoRU+OurwNwSDvHofAXisC42mnnL63nzlpew7S6oa/3SZd
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.1] cpu: Update
	documentation and comment
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
X-List-Received-Date: Tue, 08 May 2012 17:29:26 -0000

On 05/02/2012 03:28 PM, Andreas Färber wrote:
> State struct CPU had been renamed to CPUState, former CPUState to
> CPUArchState.
>
> Signed-off-by: Andreas Färber<afaerber@suse.de>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   include/qemu/cpu.h |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/qemu/cpu.h b/include/qemu/cpu.h
> index 4291279..78b65b3 100644
> --- a/include/qemu/cpu.h
> +++ b/include/qemu/cpu.h
> @@ -39,7 +39,7 @@ typedef struct CPUState CPUState;
>
>   /**
>    * CPUClass:
> - * @reset: Callback to reset the #CPU to its initial state.
> + * @reset: Callback to reset the #CPUState to its initial state.
>    *
>    * Represents a CPU family or model.
>    */
> @@ -61,7 +61,7 @@ struct CPUState {
>       Object parent_obj;
>       /*<  public>*/
>
> -    /* TODO Move common fields from CPUState here. */
> +    /* TODO Move common fields from CPUArchState here. */
>   };
>
>


