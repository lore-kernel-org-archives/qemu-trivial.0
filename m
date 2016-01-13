Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aJQhh-00014t-Kj
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2016 14:03:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aJQhf-00014X-4U
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 14:03:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aJQhc-0007xI-A1
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 14:03:31 -0500
Received: from nm1-vm2.bullet.mail.gq1.yahoo.com ([98.136.218.81]:40015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aJQhc-0007wx-15
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 14:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1452711806; bh=PC6NLonuZ5dHZX7VIxi1BEEDFGDaNfHuAkW6QVWmacg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
	b=OmYn0UsJC+CmkHykpeVbeTkX6wlKUtT0Lqmzowvs/8QhktpO1/Ooxo9l1wjDKAnSLsMKsMSfW1mHUO8psogC5hB2j6t/+v26qV1WLuhOIzaWeXWi7w3lZywBmkx9PPlYPKb1p/Ng6N6STeBIBcgrVkFozQR5tISWc92fr7kkSAPI1VGe+JFvrnLGgTnyGCOBitgewEj2foxVVzVjj0pAfGglzDHMyGNBPowQ2UWV7cHAEBvTKnfV+SmfUAHngng+yGnqgx2yhx67+n37CPGdNmDfM/xvYdTJOYKZi3u3MHjhLgPVGLjizWwRIqAjIyYEQTbmvdPIh6JfIvkkuJC9/Q==
Received: from [98.137.12.55] by nm1.bullet.mail.gq1.yahoo.com with NNFMP;
	13 Jan 2016 19:03:26 -0000
Received: from [208.71.42.195] by tm15.bullet.mail.gq1.yahoo.com with NNFMP;
	13 Jan 2016 19:03:26 -0000
Received: from [127.0.0.1] by smtp206.mail.gq1.yahoo.com with NNFMP;
	13 Jan 2016 19:03:26 -0000
X-Yahoo-Newman-Id: 241529.19505.bm@smtp206.mail.gq1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: KCYWK0IVM1kjiY_NMHDM0K88TH0zWm_aEyRcfTR3TAEXg8L
	Jkj9KZr9mpWEUY78yIOJk8lRrc3yrGhSzTzk2cqE1soZhA3Y5Y0Dfm_u19b_
	RY.7n..hsdvoH7kn9QrFhbzpE4nlOekDktORxkNyb1zlfDQfaYrxMVMDADe1
	ADQdtNqSqU0yzutu10ZspdzFHczhM7rtXGlReyz3fI7PG0ruiN78EuA0LUK_
	p8YC1w4BSWT7nXCUozS51dK6RZzLeSe8U9xFMFYaSnRL5cRhFjKc.Yp3UEbY
	dKyCiWvegmAroURJkxl4IYl7Ihuavblh5KK3O5krtD8FWJhfXPDtHwKKBu3d
	2efagl3RAPd.1HvTbAGlxoIeSc9qZqcN456A37PMzhhO3d7Uxy1iiar_MwPb
	pqjdck3ht.kU.g5NnT19qnhjWsDijknPWfSDr1NIlymAmPKTGNOpe6W3HcRe
	YEECCDNBpQgkEO8u_INSdWTW8oASOdJf_Co_P3a8Tx9ZARVrHZcd5a5SLzzn
	6b0eSAmR6oHeERYUqbSPr9wh00xxQzfiPHLRdxNiOsg--
X-Yahoo-SMTP: mEA9emqswBDufi8V3X8MBXZonFM-
Date: Wed, 13 Jan 2016 19:03:17 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160113190316.GA15862@sucs.org>
References: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
	<1451979212-25479-3-git-send-email-sitsofe@yahoo.com>
	<568E5D11.9030601@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568E5D11.9030601@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.136.218.81
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/3] qemu-nbd: Minor texi updates
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
X-List-Received-Date: Wed, 13 Jan 2016 19:03:32 -0000

On Thu, Jan 07, 2016 at 01:41:53PM +0100, Paolo Bonzini wrote:
> 
> On 05/01/2016 08:33, Sitsofe Wheeler wrote:
> >  @example
> >  @c man begin SYNOPSIS
> > -usage: qemu-nbd [OPTION]...  @var{filename}
> > +@command{qemu-nbd} [OPTION]... @var{filename}
> 
> Could you send another patch that does this change (add @command, remove
> "usage:") for the other man pages as well?

OK I'll see what I can do.

-- 
Sitsofe | http://sucs.org/~sits/

