Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcl9y-0003vE-R3
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 05:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl9w-0003r8-V9
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 05:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl9v-0007jp-Br
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 05:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634634706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72VgvdPTgoeRKP+z1t139U6QTp2aqJTcRo+fO19N4jI=;
 b=f2Ob38mhpqwv3u/wrKoUzN5GhxoBRgavDc7kuWpe0U6VGKkudVAe/rr2ZF1igqao0/SOen
 D7ShERxba3WfMDNrkFBZny1zUzf7HbB0w9dFPmej6hGfhRX3oY7Hivgmyov5AZ+qTNZKpT
 baoHuUMCc3nmu+A4G6glyCD6BbOtU7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-qgqHiAYJNxS84yoJ8ehJ4Q-1; Tue, 19 Oct 2021 05:11:20 -0400
X-MC-Unique: qgqHiAYJNxS84yoJ8ehJ4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 313D4A40C2;
 Tue, 19 Oct 2021 09:11:19 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DFEB5DD68;
 Tue, 19 Oct 2021 09:11:06 +0000 (UTC)
Date: Tue, 19 Oct 2021 11:11:03 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH v2 0/6] rSTify contribution-related wiki pages
Message-ID: <YW6Lp7A9reP8Uny1@paraplu>
References: <20211019090344.3054300-1-kchamart@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019090344.3054300-1-kchamart@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 09:11:49 -0000

On Tue, Oct 19, 2021 at 11:03:38AM +0200, Kashyap Chamarthy wrote:
> My main motivation was to convert SubmitAPatch[1] based on a chat with
> Peter Maydell and Dan Berrangé on #qemu channel (on OFTC).  But the page
> also links to a couple of other contribution-related pages, so I
> converted them too:
> 
>   - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullRequest
>   - KeySigningParty: https://wiki.qemu.org/KeySigningParty
>   - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
>   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
> 
> [1] https://wiki.qemu.org/Contribute/SubmitAPatch
> 
>                 * * *

Sorry; forgot to link to v1, it's here:

    https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg05604.html
    [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck wiki
    pages

> Changes in v2:
> 
> - Consistently use the preferred rST headings: ===, ---, and ~~~~
>   [Paolo]
> - Add entries in the devel/toctree.rst [Paolo]
> - Clean up the SpellCheck wiki [Peter Maydell]
> - In trivial-patches.rst, keep only Laurent as the active maintainer
>   [Philippe]
> - Convert the wiki SubmitAPullRequest to rST, because this is also
>   linked to from the SubmitAPatch wiki page
> - Convert the KeySigningParty wiki to rST
> - Update the links to point to the rST-generated HTML files, instead of
>   wiki
> 
> Kashyap Chamarthy (6):
>   docs: rSTify the "TrivialPatches" wiki
>   docs: rSTify the "SpellCheck" wiki
>   docs: rSTify the "KeySigningParty" wiki
>   docs: rSTify the "SubmitAPullRequest" wiki
>   docs: rSTify the "SubmitAPatch" wiki
>   docs/devel: Update the rST index file
> 
>  docs/devel/index.rst                     |   5 +
>  docs/devel/key-signing-party.rst         | 171 +++++++++
>  docs/devel/spell-check.rst               |  20 +
>  docs/devel/submitting-a-patch.rst        | 460 +++++++++++++++++++++++
>  docs/devel/submitting-a-pull-request.rst |  79 ++++
>  docs/devel/trivial-patches.rst           |  51 +++
>  6 files changed, 786 insertions(+)
>  create mode 100644 docs/devel/key-signing-party.rst
>  create mode 100644 docs/devel/spell-check.rst
>  create mode 100644 docs/devel/submitting-a-patch.rst
>  create mode 100644 docs/devel/submitting-a-pull-request.rst
>  create mode 100644 docs/devel/trivial-patches.rst
> 
> -- 
> 2.31.1
> 
> 

-- 
/kashyap


