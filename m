Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcnjX-0001C9-0J
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 07:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcnjM-00017v-PH
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 07:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcnjG-0005Ex-Db
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 07:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634644581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DzBwl2UonrMgVS1zcDHmgAp1/UWkRq0AoCS+5tCAzE=;
 b=ZEnmOoRMb4nhdr36KpbvTMjAriA620AH0OuHMG5T26kCt8d0tnvuebAjO6DckNgrd/Dh8Y
 0nh4f6RwYDmzXbEvDtIVWHTlnG8hluBkp3lFAI0hCaDFhidaKK53aotUfDO/7RHqB0UxAt
 SPO0BUOJWRGpnv64LIlnHh/GMS4Fmnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-h74xdmUJMLCLHgvR5l6Nsw-1; Tue, 19 Oct 2021 07:56:15 -0400
X-MC-Unique: h74xdmUJMLCLHgvR5l6Nsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26480802575;
 Tue, 19 Oct 2021 11:56:14 +0000 (UTC)
Received: from paraplu (unknown [10.39.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A13D4180;
 Tue, 19 Oct 2021 11:55:52 +0000 (UTC)
Date: Tue, 19 Oct 2021 13:55:50 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/6] docs: rSTify the "TrivialPatches" wiki
Message-ID: <YW6yRhyMNAoEnTG1@paraplu>
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <20211019090344.3054300-2-kchamart@redhat.com>
 <322f1d0e-e349-5554-9112-65a01f97c2e7@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <322f1d0e-e349-5554-9112-65a01f97c2e7@vivier.eu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
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
X-List-Received-Date: Tue, 19 Oct 2021 11:56:33 -0000

On Tue, Oct 19, 2021 at 11:18:40AM +0200, Laurent Vivier wrote:
> Le 19/10/2021 à 11:03, Kashyap Chamarthy a écrit :
> > The original wiki is here[1].  I converted by copying the wiki source
> > into a .wiki file and convert to rST using `pandoc`:
> > 
> >         $ pandoc -f Mediawiki -t rst trivial-patches.wiki -o trivial-patches.rst
> > 
> > Update the active maintainer names to reflect current reality.
> > 
> > [1] https://wiki.qemu.org/Contribute/TrivialPatches
> > 
> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> > ---
> > I've only retained Laurent's name as per Philip's review here:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg05624.html
> 
> Thank you Kashyap.
> 
> so you should also remove Michael's repo (corpit.ru).

Ah, yes.  I knew I missed something but couldn't tell what.  Before I
respin, I'll wait for any other comments on the series.  (If it's the
only change, perhaps I can request whoever is applying the patch series
to make the edit.)

[...]

-- 
/kashyap


