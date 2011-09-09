Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R1wv3-0003NT-BP
	for mharc-qemu-trivial@gnu.org; Fri, 09 Sep 2011 04:58:41 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R1wv0-0003GJ-TO
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2011 04:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R1wuz-0001NV-Sd
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2011 04:58:38 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:43049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R1wux-0001Kz-Ik; Fri, 09 Sep 2011 04:58:35 -0400
Received: by mail-fx0-f45.google.com with SMTP id b27so2595723fxb.4
	for <multiple recipients>; Fri, 09 Sep 2011 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q8CthyuItGsqXXXo0DIeaSArGrVmUcVwPwnnqWi+uBo=;
	b=aoErwtVejnqCEHeXYObsVGh+I880ISGbhKHo/M1OMPpb+sB7sV+kVzMFl0O7HMjy3E
	gii6vh1+8/+dEnZ6V/UbE2k/JXz0+u9DgqGwpdRvtWqp4K0303UmKv+iXm+NLIg8RzkF
	nRr/p6lpPKSPDk7azwcg4hIh6GN1DH3HhaCfk=
Received: by 10.223.97.210 with SMTP id m18mr1322059fan.127.1315558715007;
	Fri, 09 Sep 2011 01:58:35 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id h22sm2585538fag.15.2011.09.09.01.58.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 01:58:33 -0700 (PDT)
Date: Fri, 9 Sep 2011 09:58:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Nathan Kunkee <nkunkee42@hotmail.com>
Message-ID: <20110909085830.GB7699@stefanha-thinkpad.localdomain>
References: <BLU0-SMTP1229303F26E34F713CF60E3BC010@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BLU0-SMTP1229303F26E34F713CF60E3BC010@phx.gbl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] SPARC: Trivial patch to clean up npc
 monitor output
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
X-List-Received-Date: Fri, 09 Sep 2011 08:58:40 -0000

On Thu, Sep 08, 2011 at 09:58:31PM -0500, Nathan Kunkee wrote:
> 
>  This patch fixes the spacing of the PC and NPC output from 'info
> cpus' for SPARC.
> 
> Signed-off-by: Nathan Kunkee <nkunkee42@hotmail.com>

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

