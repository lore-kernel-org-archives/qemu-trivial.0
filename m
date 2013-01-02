Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TqXd0-0001Gt-Gt
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2013 18:21:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1TqXcy-0001BX-NE
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 18:21:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1TqXcx-0000N8-He
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 18:21:40 -0500
Received: from mail-gh0-f181.google.com ([209.85.160.181]:36653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1TqXcv-0000Lw-E1; Wed, 02 Jan 2013 18:21:37 -0500
Received: by mail-gh0-f181.google.com with SMTP id y8so1659100ghb.26
	for <multiple recipients>; Wed, 02 Jan 2013 15:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=IFRDqp1HbjoglyX3p6kKItRMYarZIgrjxYDsUqGs1BQ=;
	b=f/VUZHCXY3ODYL+rgD1BN2wSED4fq5DAqLoxfOrkwah4Agkwj0kJpbHQHH0Dl989cf
	C+aVKEGeo6AUOWP7QTpkc9ewi+isUoXvXsK0SICLawfAfChnpotdcpAJOPwhfnWrRo61
	WD/VBEOQc5ukUHSyONJu9y1pTytdcqARBz2d94cB6bKznD+mJ1A5L9jU5tFbLlKXPf85
	GvcsWHMqCZzBimZhBo3vst16D3snC2r7ksfIj2mn1pKblssdONP5IIihfi+kS+CWx7gi
	XiduGD1xNSbVmXGehWXRq/AYa4i/LPgWiEfv3dVDvPOOE2MM61UuO1gAJXEM9nW/5UAU
	sPhw==
X-Received: by 10.236.175.104 with SMTP id y68mr47688822yhl.21.1357168503396; 
	Wed, 02 Jan 2013 15:15:03 -0800 (PST)
Received: from localhost (cpe-72-179-62-111.austin.res.rr.com. [72.179.62.111])
	by mx.google.com with ESMTPS id a15sm232619ank.22.2013.01.02.15.15.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 15:15:02 -0800 (PST)
Sender: fluxion <flukshun@gmail.com>
Date: Wed, 2 Jan 2013 17:14:21 -0600
From: mdroth <mdroth@linux.vnet.ibm.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20130102231421.GC17859@vm>
References: <1357143311-10927-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1357143311-10927-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qga: add missing commas in json docs
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
X-List-Received-Date: Wed, 02 Jan 2013 23:21:41 -0000

On Wed, Jan 02, 2013 at 09:15:11AM -0700, Eric Blake wrote:
> * qga/qapi-schema.json: Use valid JSON.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Thanks, applied to qga branch

> ---
>  qga/qapi-schema.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index ed0eb69..d91d903 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -31,7 +31,7 @@
>  #
>  # Since: 1.1
>  # ##
> -{ 'command': 'guest-sync-delimited'
> +{ 'command': 'guest-sync-delimited',
>    'data':    { 'id': 'int' },
>    'returns': 'int' }
> 
> @@ -69,7 +69,7 @@
>  #
>  # Since: 0.15.0
>  ##
> -{ 'command': 'guest-sync'
> +{ 'command': 'guest-sync',
>    'data':    { 'id': 'int' },
>    'returns': 'int' }
> 
> -- 
> 1.8.0.2
> 

