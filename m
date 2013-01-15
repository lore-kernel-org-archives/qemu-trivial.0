Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tv3E9-0003TQ-3I
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jan 2013 04:54:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tv3E4-0003G7-Jh
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 04:54:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tv3E3-0000Hi-Dc
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 04:54:36 -0500
Received: from mail-wi0-f179.google.com ([209.85.212.179]:51151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tv3E0-0000H5-0J; Tue, 15 Jan 2013 04:54:32 -0500
Received: by mail-wi0-f179.google.com with SMTP id o1so2097209wic.12
	for <multiple recipients>; Tue, 15 Jan 2013 01:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=9SIuee2TDAJqkdL3xiRbwwEe7l27zuU9k73wpglZR5I=;
	b=dmjVmCOVJbuYcXCqJQS0MNhmNtPfNmWIWdgRyyjMWFHQ3bgO3b30NxnFDZuFx/eczk
	Mg03Thq+yw2wlE+gZWIy/BXJ+f96dIIdNRz+UJgOaQd23VZXwiJfrCLNZgaFsyRUhAUB
	7l2PqSky49eNJrOFaiGUVuMDPJcb9ZnHHWZsDhVIlpRkBYKLwAzko8NAegOVli4GHG4d
	6IY3b0eHw0dW4EoDTxULUdvFhsXyxydJWq9MSwHlYUP9674IMsHUx8kTSADjkAs3VWvk
	IRn+2HFHHOdCgaEwU9kS0qnnrTCuHMKtL1jNdAdkV2JA4nI4Hh1TzEosdEq1Qo365lgE
	zzyQ==
X-Received: by 10.180.109.195 with SMTP id hu3mr2417769wib.31.1358243671088;
	Tue, 15 Jan 2013 01:54:31 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id s10sm2982756wiw.4.2013.01.15.01.54.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 01:54:30 -0800 (PST)
Date: Tue, 15 Jan 2013 10:54:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20130115095428.GB2654@stefanha-thinkpad.redhat.com>
References: <1358214910-12581-1-git-send-email-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1358214910-12581-1-git-send-email-afaerber@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.179
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, anthony@codemonkey.ws,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2] qom: Make
 object_resolve_path_component() path argument const
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
X-List-Received-Date: Tue, 15 Jan 2013 09:54:38 -0000

On Tue, Jan 15, 2013 at 02:55:10AM +0100, Andreas Färber wrote:
> A usage with a hardcoded partial path such as
> 
>   object_resolve_path_component(obj, "foo")
> 
> is totally valid but currently leads to a compilation error. Fix this.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  include/qom/object.h |    2 +-
>  qom/object.c         |    2 +-
>  2 Dateien geändert, 2 Zeilen hinzugefügt(+), 2 Zeilen entfernt(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

