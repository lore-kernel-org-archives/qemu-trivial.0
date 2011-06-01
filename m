Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRtvu-0000Ch-Rt
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2011 18:30:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QRtvr-0000Bj-AJ
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2011 18:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QRtvq-00069C-2W
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2011 18:30:31 -0400
Received: from mail-pv0-f173.google.com ([74.125.83.173]:50785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QRtvp-00068z-Fi; Wed, 01 Jun 2011 18:30:29 -0400
Received: by pvg3 with SMTP id 3so135147pvg.4
	for <multiple recipients>; Wed, 01 Jun 2011 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=rSpnCXsiLnhQrfPICfAfOFkIzjmflDiIu2WPxomSeMw=;
	b=YHnDcahzd5uN14MBar/pZTxqdhzOAbWixSn1HWSQCHr1CyvFtLkcvIxkuIcxB9q9NT
	6RCYyRfd42CFDzZNXCRT+ggkRnOHduFepfFgZ81Ej41OLAe0KxszQfqQafIDS9m9pYjS
	GwuSY1H8Hd010t8OHkfPqy+KsRhFSfCOHThoo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=gk/YGqBQJc8eFXvIIJFj6nC+n5fdXZJRhmCm/v3QtvzSPjuMDM3AxCDHx8K4Z4cn22
	FBDzKt5eMs0b9iwvcf9UIoTXNHgFIP1iU59uLDJbhFXxCfCe1WCqdiDyUXm3ReELesk3
	PIcrgk6JSPXd/VP1GtGg8vSuTkkfLyUwq9s60=
Received: by 10.142.127.20 with SMTP id z20mr1608wfc.305.1306967427757;
	Wed, 01 Jun 2011 15:30:27 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([219.127.234.11])
	by mx.google.com with ESMTPS id b8sm1430861pbj.94.2011.06.01.15.30.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 15:30:26 -0700 (PDT)
Date: Wed, 1 Jun 2011 23:30:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20110601223019.GA25411@stefanha-thinkpad.localdomain>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>
	<4DE4F16D.6030009@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4DE4F16D.6030009@codemonkey.ws>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.173
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <andreas.faerber@web.de>,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Wed, 01 Jun 2011 22:30:33 -0000

On Tue, May 31, 2011 at 08:47:25AM -0500, Anthony Liguori wrote:
> On 05/29/2011 04:50 PM, Andreas Färber wrote:
> >BeOS and Haiku don't define SIGIO. When undefined, it won't arrive
> >and doesn't need to be blocked.
> >
> >Signed-off-by: Andreas Färber<andreas.faerber@web.de>
> 
> Anything to do with signal masks is never a trivial patch BTW...

If you'll take this patch directly then I'll drop it off the radar.

Stefan

