Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxvMC-0001bE-Ko
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2013 03:06:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TxvM9-0001RP-2K
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2013 03:06:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TxvM7-0005U3-SY
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2013 03:06:48 -0500
Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231]:48595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TxvM7-0005Tg-N2; Wed, 23 Jan 2013 03:06:47 -0500
Received: by mail-we0-f177.google.com with SMTP id d7so1004323wer.36
	for <multiple recipients>; Wed, 23 Jan 2013 00:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=s6blnA/l+kS7kRUqWXOE8tGXR5SZeDqBbWHYk5rGFsc=;
	b=U6J7K1/KaefUJTPR/TYtvQjwYWi0rzL0pvW44QlRERENwaUYv27hVhO1Cu2BI2f3Lk
	G+vljz0Ku26SVRw+i486Qw/j9bw7VuvRPG7vLAYU0/Tp+hkukV1e/n2tccGz9bAXaiqK
	6bEkBtliT4VYRtvytgkqpm7TS/pXXDvxQP82qS4mhp5JshLsuUoQVxui1ZKD75fqdjD4
	Ci5yraj6mmxaYeTG4QDIC6No6GaqSttSV6np4OKUhR/YqjguV7fdF8ZH888/deQZgwEg
	rESW6OTKkkSZy76mqyEMj4N8gm2TN7qVZA9aoim1U2LDl1NTOzng84Z5YDls5xE0lifO
	M0mQ==
X-Received: by 10.194.76.165 with SMTP id l5mr690573wjw.14.1358928406553;
	Wed, 23 Jan 2013 00:06:46 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id eo10sm28237476wib.9.2013.01.23.00.06.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 23 Jan 2013 00:06:45 -0800 (PST)
Date: Wed, 23 Jan 2013 08:46:24 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
Message-ID: <20130123074624.GB4121@stefanha-thinkpad>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
	<1358849286-24750-12-git-send-email-armbru@redhat.com>
	<20130122145421.152dbb76@doriath.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130122145421.152dbb76@doriath.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::231
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 11/11] qemu-ga: Fix
 unchecked strdup() by converting to g_strdup()
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
X-List-Received-Date: Wed, 23 Jan 2013 08:06:51 -0000

On Tue, Jan 22, 2013 at 02:54:21PM -0200, Luiz Capitulino wrote:
> On Tue, 22 Jan 2013 11:08:06 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
> 
> > I figure it's freed somewhere deep down in QAPI, with g_free().
> 
> It is, by qapi_dealloc_type_str().
> 
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

Thanks for the reviews, Luiz.  Your Reviewed-by: has been added to the
2 commits.

Stefan

