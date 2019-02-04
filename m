Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqdNn-00041p-9l
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 07:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqdNl-000416-Ez
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 07:29:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqdNk-0006w4-0x
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 07:29:49 -0500
Resent-Date: Mon, 04 Feb 2019 07:29:49 -0500
Resent-Message-Id: <E1gqdNk-0006w4-0x@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1gqdNj-0006uZ-OD
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 07:29:47 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1549283347; cv=none; d=zoho.com; s=zohoarc; 
	b=nyVtCbhJ6aywIPb+3/4u5XAp6mxb+MpFwqWi4e3xLzqMAdhMUQZTkTFWR66BY3FLBVhAvHvirTLC80bzazk9OfDV8XNLX/arQ4XE6JaQD/LSXVyfrIC4MlIavGYxXNEl6WIP+1VaBm88k7jp7KYkVf8Dy/4USG3qml+9tn6hWGs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1549283347;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=PydCvLSLkeNEucAkoqtPYO5uQULOQJoBIe8+xKzj08E=; 
	b=jDcuQIHtYCtt45JQNQLScVAEjSATL9aW2kDfXR+N8wiAzSrcj49PlTca8ceCk+XH6GLZCVcB+AanYGYiquhb3pPIAUPJ74ZPSD2XIv//sYcfEGc6WNrhRYrPV4Ez5kM0nWmM0uhhbvPJMmNu/9p4EhWJ+BhaAROqSgioUPlkmwY=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1549283345662413.33144606050894;
	Mon, 4 Feb 2019 04:29:05 -0800 (PST)
Message-ID: <154928334457.29184.13479577995288933355@ebba9967afc0>
In-Reply-To: <1549282241-23535-1-git-send-email-thuth@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Cc: fam@euphon.net, kraxel@redhat.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon, 4 Feb 2019 04:29:05 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] ui/sdl_keysym: Remove
 obsolete SDL1.2 related code
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
X-List-Received-Date: Mon, 04 Feb 2019 12:29:50 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTQ5MjgyMjQxLTIzNTM1LTEt
Z2l0LXNlbmQtZW1haWwtdGh1dGhAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRl
c3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2Vy
IGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBU
RVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1p
bmd3QGZlZG9yYSBTSE9XX0VOVj0xIEo9MTQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgpDb25m
aWd1cmUgb3B0aW9uczoKLS1lbmFibGUtd2Vycm9yIC0tdGFyZ2V0LWxpc3Q9eDg2XzY0LXNvZnRt
bXUsYWFyY2g2NC1zb2Z0bW11IC0tcHJlZml4PS90bXAvcWVtdS10ZXN0L2luc3RhbGwgLS1weXRo
b249L3Vzci9iaW4vcHl0aG9uMyAtLWNyb3NzLXByZWZpeD14ODZfNjQtdzY0LW1pbmd3MzItIC0t
ZW5hYmxlLXRyYWNlLWJhY2tlbmRzPXNpbXBsZSAtLWVuYWJsZS1nbnV0bHMgLS1lbmFibGUtbmV0
dGxlIC0tZW5hYmxlLWN1cmwgLS1lbmFibGUtdm5jIC0tZW5hYmxlLWJ6aXAyIC0tZW5hYmxlLWd1
ZXN0LWFnZW50IC0td2l0aC1zZGxhYmk9Mi4wCkVSUk9SOiB1bmtub3duIG9wdGlvbiAtLXdpdGgt
c2RsYWJpPTIuMApUcnkgJy90bXAvcWVtdS10ZXN0L3NyYy9jb25maWd1cmUgLS1oZWxwJyBmb3Ig
bW9yZSBpbmZvcm1hdGlvbgojIFFFTVUgY29uZmlndXJlIGxvZyBNb24gRmViICA0IDEyOjI4OjU0
IFVUQyAyMDE5CiMgQ29uZmlndXJlZCB3aXRoOiAnL3RtcC9xZW11LXRlc3Qvc3JjL2NvbmZpZ3Vy
ZScgJy0tZW5hYmxlLXdlcnJvcicgJy0tdGFyZ2V0LWxpc3Q9eDg2XzY0LXNvZnRtbXUsYWFyY2g2
NC1zb2Z0bW11JyAnLS1wcmVmaXg9L3RtcC9xZW11LXRlc3QvaW5zdGFsbCcgJy0tcHl0aG9uPS91
c3IvYmluL3B5dGhvbjMnICctLWNyb3NzLXByZWZpeD14ODZfNjQtdzY0LW1pbmd3MzItJyAnLS1l
bmFibGUtdHJhY2UtYmFja2VuZHM9c2ltcGxlJyAnLS1lbmFibGUtZ251dGxzJyAnLS1lbmFibGUt
bmV0dGxlJyAnLS1lbmFibGUtY3VybCcgJy0tZW5hYmxlLXZuYycgJy0tZW5hYmxlLWJ6aXAyJyAn
LS1lbmFibGUtZ3Vlc3QtYWdlbnQnICctLXdpdGgtc2RsYWJpPTIuMCcKLS0tCmZ1bmNzOiBkb19j
b21waWxlciBkb19jYyBjb21waWxlX29iamVjdCBjaGVja19kZWZpbmUgbWFpbgpsaW5lczogOTIg
MTIyIDYxNyA2MzQgMAp4ODZfNjQtdzY0LW1pbmd3MzItZ2NjIC1EX0dOVV9TT1VSQ0UgLURfRklM
RV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09VUkNFIC1Xc3RyaWN0LXByb3RvdHlwZXMg
LVdyZWR1bmRhbnQtZGVjbHMgLVdhbGwgLVd1bmRlZiAtV3dyaXRlLXN0cmluZ3MgLVdtaXNzaW5n
LXByb3RvdHlwZXMgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZ3cmFwdiAtc3Rk
PWdudTk5IC1jIC1vIGNvbmZpZy10ZW1wL3FlbXUtY29uZi5vIGNvbmZpZy10ZW1wL3FlbXUtY29u
Zi5jCmNvbmZpZy10ZW1wL3FlbXUtY29uZi5jOjI6MjogZXJyb3I6ICNlcnJvciBfX2xpbnV4X18g
bm90IGRlZmluZWQKICNlcnJvciBfX2xpbnV4X18gbm90IGRlZmluZWQKICBefn5+fgoKLS0tCmZ1
bmNzOiBkb19jb21waWxlciBkb19jYyBjb21waWxlX29iamVjdCBjaGVja19kZWZpbmUgbWFpbgps
aW5lczogOTIgMTIyIDYxNyA2ODYgMAp4ODZfNjQtdzY0LW1pbmd3MzItZ2NjIC1EX0dOVV9TT1VS
Q0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09VUkNFIC1Xc3RyaWN0LXBy
b3RvdHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVdhbGwgLVd1bmRlZiAtV3dyaXRlLXN0cmluZ3Mg
LVdtaXNzaW5nLXByb3RvdHlwZXMgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZ3
cmFwdiAtc3RkPWdudTk5IC1jIC1vIGNvbmZpZy10ZW1wL3FlbXUtY29uZi5vIGNvbmZpZy10ZW1w
L3FlbXUtY29uZi5jCmNvbmZpZy10ZW1wL3FlbXUtY29uZi5jOjI6MjogZXJyb3I6ICNlcnJvciBf
X2kzODZfXyBub3QgZGVmaW5lZAogI2Vycm9yIF9faTM4Nl9fIG5vdCBkZWZpbmVkCiAgXn5+fn4K
Ci0tLQpmdW5jczogZG9fY29tcGlsZXIgZG9fY2MgY29tcGlsZV9vYmplY3QgY2hlY2tfZGVmaW5l
IG1haW4KbGluZXM6IDkyIDEyMiA2MTcgNjg5IDAKeDg2XzY0LXc2NC1taW5ndzMyLWdjYyAtRF9H
TlVfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0
cmljdC1wcm90b3R5cGVzIC1XcmVkdW5kYW50LWRlY2xzIC1XYWxsIC1XdW5kZWYgLVd3cml0ZS1z
dHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29t
bW9uIC1md3JhcHYgLXN0ZD1nbnU5OSAtYyAtbyBjb25maWctdGVtcC9xZW11LWNvbmYubyBjb25m
aWctdGVtcC9xZW11LWNvbmYuYwpjb25maWctdGVtcC9xZW11LWNvbmYuYzoyOjI6IGVycm9yOiAj
ZXJyb3IgX19JTFAzMl9fIG5vdCBkZWZpbmVkCiAjZXJyb3IgX19JTFAzMl9fIG5vdCBkZWZpbmVk
CiAgXn5+fn4KCi0tLQpsaW5lczogOTIgMTI4IDkyMCAwCng4Nl82NC13NjQtbWluZ3czMi1nY2Mg
LW10aHJlYWRzIC1EX0dOVV9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJ
TEVfU09VUkNFIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVdhbGwgLVd1
bmRlZiAtV3dyaXRlLXN0cmluZ3MgLVdtaXNzaW5nLXByb3RvdHlwZXMgLWZuby1zdHJpY3QtYWxp
YXNpbmcgLWZuby1jb21tb24gLWZ3cmFwdiAtc3RkPWdudTk5IC1vIGNvbmZpZy10ZW1wL3FlbXUt
Y29uZi5leGUgY29uZmlnLXRlbXAvcWVtdS1jb25mLmMgLWcgLWxpYmVydHkKL3Vzci9saWIvZ2Nj
L3g4Nl82NC13NjQtbWluZ3czMi84LjIuMC8uLi8uLi8uLi8uLi94ODZfNjQtdzY0LW1pbmd3MzIv
YmluL2xkOiBjYW5ub3QgZmluZCAtbGliZXJ0eQpjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVk
IDEgZXhpdCBzdGF0dXMKRmFpbGVkIHRvIHJ1biAnY29uZmlndXJlJwpUcmFjZWJhY2sgKG1vc3Qg
cmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiLi90ZXN0cy9kb2NrZXIvZG9ja2VyLnB5IiwgbGlu
ZSA1NjMsIGluIDxtb2R1bGU+CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8xNTQ5MjgyMjQxLTIzNTM1LTEtZ2l0LXNlbmQtZW1haWwtdGh1dGhA
cmVkaGF0LmNvbS90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3
Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0
LmNvbQ==


