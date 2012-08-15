Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1dsw-0007En-Q6
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:43:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dsu-0007EZ-Co
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dss-0004hr-QZ
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:43:44 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:58989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1dss-0004hc-L7; Wed, 15 Aug 2012 09:43:42 -0400
Received: by wgbfm10 with SMTP id fm10so1119657wgb.10
	for <multiple recipients>; Wed, 15 Aug 2012 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=stsRzbFsbZfiohZrzJvgUTASAEn+EDURDrd6lsNPjKw=;
	b=SUr6BGQRVdu0T80nZORkOwVejwOZYV7cqJUWPHjhCGL0F2NTGf2AMS+nzo8wwKeNFR
	lgaAGYMwPuui7KvB6SFjvB9xnSeNOQ8dng/ZLSiekmzZsxs2DSNe+hlbogVxvp6VvT2X
	bueapBB3i0UWOgnqRQKyMgQ7dSg4rZKOLMZ7zFmZPrM8adOK2Mqwh4Xf0IyLtutH/SsN
	pvAM81Dz1O+28WfZs//eU3few5Ywj1LSQ91+f6akMsTm/fnFLl6VHIR+ZZHV6WSOMaXy
	Dqp4P20V3e2ZX6inIZmy5E/38Pe8tI6Bw92cLZxEOwXtvYw1W8d66SdcfsqGIMi2+6HA
	sB7g==
Received: by 10.180.83.66 with SMTP id o2mr37185027wiy.14.1345038221698;
	Wed, 15 Aug 2012 06:43:41 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id bc2sm4713546wib.0.2012.08.15.06.43.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:43:40 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:43:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120815134337.GF10742@stefanha-thinkpad.localdomain>
References: <1344628087-22672-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344628087-22672-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix QEMU
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
X-List-Received-Date: Wed, 15 Aug 2012 13:43:45 -0000

On Fri, Aug 10, 2012 at 09:48:07PM +0200, Stefan Weil wrote:
> One more...
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  scripts/simpletrace.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Updated the commit description to be more specific :).

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

