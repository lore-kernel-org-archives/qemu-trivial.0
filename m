Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtHle-0006Oy-Nx
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jul 2020 17:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jtHlc-0006JS-Dt
 for qemu-trivial@nongnu.org; Wed, 08 Jul 2020 17:38:12 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52976
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jtHlY-0003QE-QX
 for qemu-trivial@nongnu.org; Wed, 08 Jul 2020 17:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594244288;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8Z2Gh8iDn/pnjTwj/tk9pg091TYfdl6bfJD17+GLrn4=;
 b=Va4WtbCMo4oTkuva1YlVOBa4AGpabfvkF+RusK6JgJYxDiJd8DACtWT+M0f+d1VDUd/jtN
 SAFNaVNXXPY6l0iGcx/LkDbSM32N8jXa1Q7oLGhovOj49Dd4OluBN/RhOXTlQMjKWnAbrs
 waft7Gr0yCl6AUaY5xM/gOJOf/n2c6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-wJIGFVQANCeLH0FuHYQ-RQ-1; Wed, 08 Jul 2020 07:35:16 -0400
X-MC-Unique: wJIGFVQANCeLH0FuHYQ-RQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD221940920;
 Wed,  8 Jul 2020 11:35:10 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8423660E1C;
 Wed,  8 Jul 2020 11:34:39 +0000 (UTC)
Date: Wed, 8 Jul 2020 12:34:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: dinechin@redhat.com, peter.maydell@linaro.org,
 dmitry.fleytman@gmail.com, mst@redhat.com, jasowang@redhat.com,
 mark.cave-ayland@ilande.co.uk, mdroth@linux.vnet.ibm.com,
 jcmvbkbc@gmail.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 mreitz@redhat.com, marex@denx.de, sstabellini@kernel.org,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, paul@xen.org,
 magnus.damm@gmail.com, armbru@redhat.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, marcandre.lureau@redhat.com,
 rth@twiddle.net, atar4qemu@gmail.com, alistair@alistair23.me,
 ehabkost@redhat.com, mjt@tls.msk.ru, riku.voipio@iki.fi, pl@kamp.de,
 dgilbert@redhat.com, r.bolshakov@yadro.com, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, ronniesahlberg@gmail.com,
 xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au, kwolf@redhat.com,
 ysato@users.sourceforge.jp, philmd@redhat.com, crwulff@gmail.com,
 laurent@vivier.eu, jcd@tribudubois.net, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
Message-ID: <20200708113436.GG3229307@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200706162300.1084753-1-dinechin@redhat.com>
 <159405307662.7847.17757844911728214859@d1fd068a5071>
MIME-Version: 1.0
In-Reply-To: <159405307662.7847.17757844911728214859@d1fd068a5071>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 08 Jul 2020 21:38:12 -0000

On Mon, Jul 06, 2020 at 09:31:21AM -0700, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200706162300.1084753-1-dinechin@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Subject: [PATCH] trivial: Remove trailing whitespaces
> Type: series
> Message-id: 20200706162300.1084753-1-dinechin@redhat.com
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20200706162300.1084753-1-dinechin@redhat.com -> patchew/20200706162300.1084753-1-dinechin@redhat.com
> Switched to a new branch 'test'
> 9af3e90 trivial: Remove trailing whitespaces
> 
> === OUTPUT BEGIN ===

snip

> ERROR: trailing whitespace
> #2395: FILE: target/sh4/op_helper.c:149:
> +^I$

One case of trailing whitespace missed.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


