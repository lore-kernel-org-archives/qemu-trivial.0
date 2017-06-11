Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dKAPx-0007g4-Gh
	for mharc-qemu-trivial@gnu.org; Sun, 11 Jun 2017 17:29:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1dKAPv-0007ed-JD
	for qemu-trivial@nongnu.org; Sun, 11 Jun 2017 17:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1dKAPu-000128-S1
	for qemu-trivial@nongnu.org; Sun, 11 Jun 2017 17:29:03 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:47606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1dKAPn-0000jo-Fc; Sun, 11 Jun 2017 17:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=Bo6zu/t0PQ4yvLJ4fpWjj8MttveJa10lt4/0q8rzVfk=; 
	b=ewcW0pRZ2ewmVpijo3mPtWDN52RlVUqdGoDogeNoPFHGHMN4UrjpN24RwtR1FvBV0jxfPTOJhQQNTZoSuUY9SInKVaBOhdJ0NNhROvMk4Gp7MEZW6EmEwSfRuDBdLsYb1y6XxBuqq1z1Tq1/AMi3VQeULsXuSdaRpkEdZ9Xf+OV47lIVI+NB0dzJf4zZyU9tHTp/p5giSTYXj68st+KAJSA+sWe3T+WkiFk1cNxEel2es2vUvBMh4aapiBztFon/CDjK4L/8/atrYMADz/ayo6RY1rSpEkd3McMfpGOUuIf0y9BmI8IuzCPojSNt0Xv+k4CXcQo2rXqXwwh5yMyyiQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dKAP9-0000Ad-SP; Sun, 11 Jun 2017 23:28:15 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1dKAP9-0006zJ-Pj; Sun, 11 Jun 2017 23:28:15 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	"open list\:Block layer core" <qemu-block@nongnu.org>,
	qemu-trivial@nongnu.org, armbru@redhat.com,
	Max Reitz <mreitz@redhat.com>, marcandre.lureau@redhat.com
In-Reply-To: <20170609152017.7286-3-eblake@redhat.com>
References: <20170609152017.7286-1-eblake@redhat.com>
	<20170609152017.7286-3-eblake@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Sun, 11 Jun 2017 23:28:15 +0200
Message-ID: <w517f0i1afk.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH 2/2] qobject: Catch another
 straggler for use of qdict_put_str()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Jun 2017 21:29:04 -0000

On Fri 09 Jun 2017 05:20:17 PM CEST, Eric Blake <eblake@redhat.com> wrote:
> Dan's addition of key-secret improvements in commit 29cf9336 was
> developed prior to the addition of QDict scalar insertion macros,
> but merged after the general cleanup in commit 46f5ac20.
> Patch created mechanically by rerunning:
>   spatch --sp-file scripts/coccinelle/qobject.cocci \
>          --macro-file scripts/cocci-macro-file.h --dir . --in-place
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

