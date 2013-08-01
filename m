Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4pwp-0001qw-BE
	for mharc-qemu-trivial@gnu.org; Thu, 01 Aug 2013 06:17:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1V4pwf-0001eI-Mc
	for qemu-trivial@nongnu.org; Thu, 01 Aug 2013 06:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1V4pwX-00071t-8b
	for qemu-trivial@nongnu.org; Thu, 01 Aug 2013 06:17:21 -0400
Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b]:62591)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1V4pPJ-0002oH-0b; Thu, 01 Aug 2013 05:42:53 -0400
Received: by mail-we0-f171.google.com with SMTP id q55so1499444wes.16
	for <multiple recipients>; Thu, 01 Aug 2013 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=28ROo7v9WuZlYMLYd2mCnJjuqbUt4Hb+0vJ9DOgkPnA=;
	b=Rtrtu+Ic6iVJj+nKBhxmk2laWm3DOl/KD7cknajng3wdK1Bof9mW/1HgKN5eiMO0T9
	ULJnF+m2cUgtX6qFg92tX9EseFS7Uvvn0hsQChgNcW+JU/24CbcRWwcWi3pdSn1VziPE
	THb9QZ4qdlQoDoJvKCrBnNd9Ju1iwyN74CWBJDTKPuc+QH/8R7PEojHOhdBbJ34Rk5jS
	QUQNiSo1r/CCqwsioup36ok6GwNYCMAMeeUSGJVxwCiZ99bxQYbrta1ag/WPnHQilIRX
	zTEddZ/p/NqXKFzxVJKyPCBWMVwc7lh0DCpdN/qefMcxoiLmiYiUdi6PqKJDhFXbrj1r
	ieSw==
X-Received: by 10.194.87.9 with SMTP id t9mr578412wjz.39.1375350172080;
	Thu, 01 Aug 2013 02:42:52 -0700 (PDT)
Received: from localhost (178-26-138-183-dynip.superkabel.de. [178.26.138.183])
	by mx.google.com with ESMTPSA id fs8sm2345610wib.0.2013.08.01.02.42.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 02:42:51 -0700 (PDT)
Date: Thu, 1 Aug 2013 11:42:49 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20130801094249.GD29838@stefanha-thinkpad.redhat.com>
References: <1375305626-26972-1-git-send-email-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1375305626-26972-1-git-send-email-rjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22b
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, qemu-devel@nongnu.org,
	afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v3] block/iscsi.c: Fix printf format
	error.
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
X-List-Received-Date: Thu, 01 Aug 2013 10:17:30 -0000

On Wed, Jul 31, 2013 at 10:20:26PM +0100, Richard W.M. Jones wrote:
> From: "Richard W.M. Jones" <rjones@redhat.com>
> 
> The error on armv7hl was:
> 
> block/iscsi.c: In function ‘is_request_lun_aligned’:
> block/iscsi.c:251:26: error: format ‘%ld’ expects argument of type ‘long int’, but argument 3 has type ‘int64_t’ [-Werror=format=]
>                           iscsilun->block_size, sector_num, nb_sectors);
>                           ^
> 
> This also splits the long line to comply with qemu coding guidelines.
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  block/iscsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

