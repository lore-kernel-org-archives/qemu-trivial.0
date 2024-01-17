Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rQ5D5-0003JW-7I
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jan 2024 07:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rQ5D1-00036n-Jl
 for qemu-trivial@nongnu.org; Wed, 17 Jan 2024 07:39:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rQ5Cx-0001rk-Dv
 for qemu-trivial@nongnu.org; Wed, 17 Jan 2024 07:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705495190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XQ9oPtxZ+OZWOGqcXgNlIz/vf3L94Ez2ww+tLDUEbYI=;
 b=Nfr2j82c95qPlGWuPFiZsG2R1mi+OQdZprVfxfd3TqVBRkRuwyxPibu0jpkmS18XUN/x/D
 n8Rt4zBna1PSPX+6CEyKnJqHow5IFhFmIqW0pED4uxlq7rdGwdUIu1kzn5CJayAbJZzrGt
 J6rQIYqLUWhmrY/xVIPB9gQbEn32NNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-_-i-hA9kMzOSBxjRh62fhw-1; Wed, 17 Jan 2024 07:39:46 -0500
X-MC-Unique: _-i-hA9kMzOSBxjRh62fhw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69BF1807F89;
 Wed, 17 Jan 2024 12:39:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47B2C2166B32;
 Wed, 17 Jan 2024 12:39:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 36F4C21E6806; Wed, 17 Jan 2024 13:39:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH 3/5] qemu-options: Remove the deprecated -async-teardown
 option
In-Reply-To: <20240112100059.965041-4-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 12 Jan 2024 11:00:57 +0100")
References: <20240112100059.965041-1-thuth@redhat.com>
 <20240112100059.965041-4-thuth@redhat.com>
Date: Wed, 17 Jan 2024 13:39:44 +0100
Message-ID: <877ck8jfqn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 17 Jan 2024 12:39:57 -0000

Thomas Huth <thuth@redhat.com> writes:

> It's been marked as deprecated since QEMU 8.1 (and was only available
> since QEMU 8.0 anyway), so it should be fine to remove this now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


