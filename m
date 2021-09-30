Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mW2s8-0001cm-1I
	for mharc-qemu-trivial@gnu.org; Thu, 30 Sep 2021 16:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mW2s5-0001bs-K8
 for qemu-trivial@nongnu.org; Thu, 30 Sep 2021 16:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mW2s1-00035E-Tl
 for qemu-trivial@nongnu.org; Thu, 30 Sep 2021 16:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633034492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b9+nyCk5CQZ+nb+gAGWOWrvTVfoFRDowXM3G5mFtzC0=;
 b=AwsZN6SwXGfOIW9isIiGzSzJPDkyELZX9VRNqfUlrKUZrTklxtstuPnOEqlm6o7alqAS7l
 U1kJFCnFMNi7vLTUy9NAP1mCVJHuLNVMsOhpbf7q2oMLPsPb9t1Ny0X7l8dQ+Ys86f1hvG
 LJs92f/TCe2l2R8u/QlwaacudCyolLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-wpxub6dAPOSzgFABxCZ6vw-1; Thu, 30 Sep 2021 16:41:29 -0400
X-MC-Unique: wpxub6dAPOSzgFABxCZ6vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6069D100C61B;
 Thu, 30 Sep 2021 20:41:28 +0000 (UTC)
Received: from redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DC0D60BF4;
 Thu, 30 Sep 2021 20:41:27 +0000 (UTC)
Date: Thu, 30 Sep 2021 15:41:25 -0500
From: Eric Blake <eblake@redhat.com>
To: ~farzon <farzon@farzon.org>
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH qemu v2] QEMU coding style mandates spaces for
 indentation. This change replaces TABs in block files.
Message-ID: <20210930204125.mmrgfw6h7i75yqng@redhat.com>
References: <163295635969.12353.14555479457179645848-0@git.sr.ht>
MIME-Version: 1.0
In-Reply-To: <163295635969.12353.14555479457179645848-0@git.sr.ht>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Sep 2021 20:41:37 -0000

On Wed, Sep 29, 2021 at 01:30:50AM -0400, ~farzon wrote:
> From: Farzon Lotfi <hi@farzon.org>

Food for thought: your git/mail configuration used one address for the
envelope (name '~farzon' as user 'farzon@') and another as the patch
author (name 'Farzon Lotfi' as user 'hi@').  Since you own your domain
(with its own perks), you can get away with it, but it looks a bit
less professional to need a second From: line to override the mail
author (which is more commonly needed to work around overly strict
DKIM settings), compared to just sending your mail from the desired
full-name author in the first place.  But since your Signed-off-by tag
is correct, this is not a show-stopper to applying your patch.

However, my next comment does require a respin before your patch would
be ready.  Your Subject: line is too long, as evidenced by your choice
of using sentences.  It should really be 'category: short description'
all within 60 characters or so (when 'git log' displays indentation, a
short commit id, and then your subject, you don't want your subject
truncated).  It feels like some of your subject should instead be part
of the commit body, where you currently have only...

> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371

...because that one line as a body is rather sparse.  While the URL is
nice (it is a lifesaver for tracking whether a particular bug has a
known patch), it does not tell me at a glance what is behind that URL,
and I don't want to have to fire up my browser to learn about your
patch.  In general, the subject should be a short "what", and the
commit body should be "why" a maintainer should apply it.  I'd suggest
the following:

block: Replace TABs with space

Bring the block file in line with the QEMU coding style, with spaces
for indentation.
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371

> 
> Signed-off-by: Farzon Lotfi <hi@farzon.org>
> ---

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


