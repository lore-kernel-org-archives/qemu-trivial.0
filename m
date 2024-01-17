Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rQ5Bw-00027d-T0
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jan 2024 07:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rQ5Bv-00027K-9b
 for qemu-trivial@nongnu.org; Wed, 17 Jan 2024 07:38:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rQ5Bt-0001m1-8j
 for qemu-trivial@nongnu.org; Wed, 17 Jan 2024 07:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705495124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KbPVctoX2d7PkJcm3EHxw6RHaYI0rAf1Fm15gpAYm60=;
 b=jRFxh91g/p/9wpdeKCfh9c/g9elvnyQ5pb8hSGkrqHNLIWy+4ismD9Dm5k1dLFHHh33i3J
 nABgh1q2q1CDXQY/59/OWCTS35XU749MPPt8Tbd1K/Jfam3eNCvpzj91+ivnxougxEENUV
 So9VYU6AXLkKXq9++544uTQFWOpLGLg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-FTnMdxuJMbmX1q8xJ_uI4A-1; Wed,
 17 Jan 2024 07:38:42 -0500
X-MC-Unique: FTnMdxuJMbmX1q8xJ_uI4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3889B3814588;
 Wed, 17 Jan 2024 12:38:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 163352026D6F;
 Wed, 17 Jan 2024 12:38:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C5B521E66F1; Wed, 17 Jan 2024 13:38:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH 2/5] qemu-options: Remove the deprecated -no-acpi option
In-Reply-To: <20240112100059.965041-3-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 12 Jan 2024 11:00:56 +0100")
References: <20240112100059.965041-1-thuth@redhat.com>
 <20240112100059.965041-3-thuth@redhat.com>
Date: Wed, 17 Jan 2024 13:38:41 +0100
Message-ID: <87bk9kjfse.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
X-List-Received-Date: Wed, 17 Jan 2024 12:38:47 -0000

Thomas Huth <thuth@redhat.com> writes:

> It's been marked as deprecated since QEMU 8.0, so it should be fine
> to remove this now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Leftovers:

docs/specs/tpm.rst:    -nographic -no-acpi \
hw/i386/pc.c:     * When -no-acpi is used with Q35 machine type, no ACPI is built,
hw/i386/pc.c:     * When -no-acpi is used with Q35 machine type, no ACPI is built,


