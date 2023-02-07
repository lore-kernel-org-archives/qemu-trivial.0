Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPRWU-00015g-A1
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2023 12:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPRWR-000158-1M
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 12:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPRWO-00079o-Qj
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 12:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675789963;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dYxNnpzbmmeTc9tw7S+v/Zm2vWN6ACM1stugjgt2tsY=;
 b=R5x0qveImQ5b/uZrt6K2jD4Y8KD7g2PmKSo5T8v2IIhCFqBDKdxpY5rAQYNhmujQnO5HKm
 X+i7iugopJt2wDNpzpfGvMKiiMqT85kQC3d2sHCUMMvr4D2QMNL6aACMMETV+cvweR5Bsk
 OfZQSFpECLjKCGFwWo9zE9KBgfq5B4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-YKRkCP1kMAeBg-CzOgD5yQ-1; Tue, 07 Feb 2023 12:12:42 -0500
X-MC-Unique: YKRkCP1kMAeBg-CzOgD5yQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAA2118A6461;
 Tue,  7 Feb 2023 17:12:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2613492B21;
 Tue,  7 Feb 2023 17:12:38 +0000 (UTC)
Date: Tue, 7 Feb 2023 17:12:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: thuth@redhat.com, anjo@rev.ng, bcain@quicinc.com, pbonzini@redhat.com,
 philmd@linaro.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 quic_acaggian@quicinc.com, tsimpson@quicinc.com
Subject: Re: [PATCH] Hexagon (meson.build): define min bison version
Message-ID: <Y+KGhCnjqOE43SIN@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
 <20230207165603.107707-1-quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230207165603.107707-1-quic_mathbern@quicinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2023 17:12:47 -0000

On Tue, Feb 07, 2023 at 01:56:03PM -0300, Matheus Tavares Bernardino wrote:
> Thomas Huth <thuth@redhat.com> wrote:
> >
> > Out of curiosity: Where did you encounter this problem? After having a quick 
> > look at https://repology.org/project/bison/versions it seems to me that all 
> > our supported OS distros should already ship bison 3.0 or newer...
> 
> I actually noticed this when compiling our downstream
> qemu-system-hexagon on macOS (Ventura 13.2), where the bundled bison
> version is 2.3 (although 3.8.2 is available through brew). I thought
> this could affect other upstream users too, but good to know that the
> supported OSes already ship bison >= 3.0.

FWIW, our testing on macOS heavily relies on the versions from brew.

You can see the list of brew pkgs we consume in

 qemu.git/.gitlab-ci.d/cirrus/macos-12.vars

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


