Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1bQr-0005qe-6j
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 13:01:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ben@skyportsystems.com>) id 1e1aC5-0001PY-GF
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 11:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ben@skyportsystems.com>) id 1e1aC1-0000EM-K5
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 11:42:13 -0400
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:56700)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ben@skyportsystems.com>)
	id 1e1aC1-0000D7-8j
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 11:42:09 -0400
Received: by mail-pf0-x231.google.com with SMTP id b85so2986392pfj.13
	for <qemu-trivial@nongnu.org>; Mon, 09 Oct 2017 08:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=skyportsystems.com; s=google;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=F5/T9fGY6pcYGU+fYztEJrk+EiLl6N/8WGLYCT3wAyY=;
	b=nha2BMDwNHm8dDeB5dJKeBeI+2CHFKBQ6HH9V2tioIpWvYD3q1kCC/xyogfoCsx9m7
	v0CX23xs+1s3QoZTFy/WAtUsPK5qv5osq8z7kIhTWZ4zeldDYgfkczrYCD+zLhuxbLu0
	xggcZA7KhgBPTU3qo/5wJKMQm02HQb9sQTzaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=F5/T9fGY6pcYGU+fYztEJrk+EiLl6N/8WGLYCT3wAyY=;
	b=pxRj+zFyDEy4ZmrR7JNP6ZidAe41H+3YUamektDoXAQysAhYFANNAsr73QAqcGl6MZ
	aTy4CItm2BB/WFQKvxu9sqy4NOgYLGOZneqB5Jyyrjr3WmTX25maWObXI8AJ3Aft1GTT
	KGLnQMCE1770A7WClrQG25umHbUAf5CTw7kWisX24/M5PqUOf9SfnUB2t4tkT54HuAHE
	4cE/z3lfHsQ/nJCtWESbXHhEVtV6pDoQpZQ4f73onCdn9pIGXHcyFjrS0G7eBA+r9y0w
	rC1dWSaFrVYMdTUSCl84xmF9czuTFOV70KlhBSFWkf3IBrgXzXyM1MRlpyuijVoMUKmk
	6JoQ==
X-Gm-Message-State: AMCzsaWVSn07xcUfCKdFeWYBQ/ishIoJk5jQ/YyX2Ujib7owD7noYoJd
	IgEg7YAJgXPgy8FSnqKjRTE1QQ==
X-Google-Smtp-Source: AOwi7QCKMkP+htsUyVvWf0WJVyRYrxphUWU1nKWCuzoVHYZIKQzwpzPmonVHR2q1X5P1vcE8kS9ZaQ==
X-Received: by 10.159.204.139 with SMTP id t11mr3651056plo.121.1507563727925; 
	Mon, 09 Oct 2017 08:42:07 -0700 (PDT)
Received: from [10.10.243.190] (67-207-112-138.static.wiline.com.
	[67.207.112.138]) by smtp.gmail.com with ESMTPSA id
	g15sm14420903pgr.57.2017.10.09.08.42.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Oct 2017 08:42:05 -0700 (PDT)
From: Ben Warren <ben@skyportsystems.com>
Message-Id: <715EB455-4141-4BF9-B13A-0879F161EA44@skyportsystems.com>
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DA158701-896C-4234-B59A-E2909EA4AB64";
	protocol="application/pkcs7-signature"; micalg=sha1
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Mon, 9 Oct 2017 08:42:05 -0700
In-Reply-To: <20171006235023.11952-82-f4bug@amsat.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-82-f4bug@amsat.org>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::231
X-Mailman-Approved-At: Mon, 09 Oct 2017 13:01:32 -0400
Subject: Re: [Qemu-trivial] [PATCH 81/88] hw/acpi: use g_new() family of
 functions
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
X-List-Received-Date: Mon, 09 Oct 2017 15:42:14 -0000


--Apple-Mail=_DA158701-896C-4234-B59A-E2909EA4AB64
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 6, 2017, at 4:50 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Ben Warren <ben@skyportsystems.com>
> ---
> hw/acpi/vmgenid.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
> index 2876d8a639..ced507d218 100644
> --- a/hw/acpi/vmgenid.c
> +++ b/hw/acpi/vmgenid.c
> @@ -269,7 +269,7 @@ GuidInfo *qmp_query_vm_generation_id(Error **errp)
>     }
>     vms =3D VMGENID(obj);
>=20
> -    info =3D g_malloc0(sizeof(*info));
> +    info =3D g_new0(GuidInfo, 1);
>     info->guid =3D qemu_uuid_unparse_strdup(&vms->guid);
>     return info;
> }
> --=20
> 2.14.2
>=20


--Apple-Mail=_DA158701-896C-4234-B59A-E2909EA4AB64
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIILJTCCBTcw
ggQfoAMCAQICED9ye6B5k0+gA4CVDazylRowDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNVBAYTAkdC
MRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoT
EUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNh
dGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE3MDcxOTAwMDAwMFoXDTE4MDcxOTIzNTk1OVow
JzElMCMGCSqGSIb3DQEJARYWYmVuQHNreXBvcnRzeXN0ZW1zLmNvbTCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAKNRYZm9a+xmI5BPBvGwd5GTtRYq3MeP41a2WqewywtPjLGDhanKK0wI
BghAAqwmQSfs1dukqG1N9fprI5+R+IqOqYle90tdF/P1YdEw6QGYxIfNLJP4Awc3No2LajOw4FcC
zRkkfCTnetztBMX7Jj2mu9+TRDlH/5nlRHZsXLbUgA5jiqha5u4RlgWCrcIdB3f1IBrQeDEaaWqc
XUiTbzqqUgTHEMAmwMf0g587n6tU/l6GhLCzPc49rF1ZD6fQoLN0Mxa/zt81MZrsXgaoz2mzvzn5
ty+9rhGIlKprjnn4vrOzYaU2ieciRLQdAz3B16/nrlVge+EwAe8KCPPIj20CAwEAAaOCAewwggHo
MB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBQCjA79fz82hhynuOG0
ET1twIBPlzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggrBgEFBQcD
BAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGyMQEC
AQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMFoGA1UdHwRT
MFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRp
Y2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJ
aHR0cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRT
ZWN1cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMCEG
A1UdEQQaMBiBFmJlbkBza3lwb3J0c3lzdGVtcy5jb20wDQYJKoZIhvcNAQELBQADggEBAERxWav/
xDSN35gLVL+7SiNwEUTMMI11WRTwYzP4uhcA5cihdsQDdT8+jljvIcVAQmSd/mLZBjbkYsJa4zpC
fX2D/EtB2D547Fj63efh0vyjLpX4hzhToiLXSXUaLWUhjUQKgGyBpDTpb/2Xbwpg7clWBHy/h4Ax
75RfOdWpaZtQ6g/VxR2mten4dQ8NhtDiv+TlB89LRlQbcGk5A0k/++HlXKwRdTlOXee8+YePAENO
OVUV4C3xuI6eXhxcHuZnBZdVdMTsb5WBsSUTONBTNR5BOUE7xLxcEchP8kHqmqaLSiN7unuUTrug
EYpB7jWGysgKCeKgkEpI9dF++Oqqp70wggXmMIIDzqADAgECAhBqm+E4O/8ra58B1dm4p1JWMA0G
CSqGSIb3DQEBDAUAMIGFMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDErMCkGA1UEAxMi
Q09NT0RPIFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xMzAxMTAwMDAwMDBaFw0yODAx
MDkyMzU5NTlaMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAw
DgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09N
T0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCCASIwDQYJ
KoZIhvcNAQEBBQADggEPADCCAQoCggEBAL6znlesKHZ1QBbHOAOY08YYdiFQ8yV5C0y1oNF9Olg+
nKcxLqf2NHbZhGra0D00SOTq9bus3/mxgUsg/Wh/eXQ0pnp8tZ8XZWAnlyKMpjL+qUByRjXCA6RQ
yDMqVaVUkbIr5SU0RDX/kSsKwer3H1pT/HUrBN0X8sKtPTdGX8XAWt/VdMLBrZBlgvnkCos+KQWW
Co63OTTqRvaq8aWccm+KOMjTcE6s2mj6RkalweyDI7X+7U5lNo6jzC8RTXtVV4/Vwdax720YpMPJ
QaDaElmOupyTf1Qib+cpukNJnQmwygjD8m046DQkLnpXNCAGjuJy1F5NATksUsbfJAr7FLUCAwEA
AaOCATwwggE4MB8GA1UdIwQYMBaAFLuvfgI9+qbxPISOre44mOzZMjLUMB0GA1UdDgQWBBSCr2yM
+MX+lmF86B89K3FIXsSLwDAOBgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADARBgNV
HSAECjAIMAYGBFUdIAAwTAYDVR0fBEUwQzBBoD+gPYY7aHR0cDovL2NybC5jb21vZG9jYS5jb20v
Q09NT0RPUlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwcQYIKwYBBQUHAQEEZTBjMDsGCCsG
AQUFBzAChi9odHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FBZGRUcnVzdENBLmNydDAk
BggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQB4
XLKBKDRPPO5fVs6fl1bsj6JrF/bz9kkIBtTYLzXN30D+03Hj6OxCDBEaIeNmsBhrJmuubvyE7Hto
SmR809AgcYboW+rcTNZ/8u/Hv+GTrNI/AhqX2/kiQNxmgUPt/eJPs92Qclj0HnVyy9TnSvGkSDU7
I5Px+TbO+88G4zipA2psZaWeEykgzClZlPz1FjTCkk77ZXp5cQYYexE6zeeN4/0OqqoAloFrjAF4
o50YJafX8mnahjp3I2Y2mkjhk0xQfhNqbzlLWPoT3m7j7U26u7zg6swjOq8hITYc3/np5tM5aVyu
6t99p17bTbY7+1RTWBviN9YJzK8HxzObXYWBf/L+VGOYNsQDTxAk0Hbvb1j6KjUhg7fO294F29QI
hhmiNOr84JHoy+fNLpfvYc/Q9EtFOI5ISYgOxLk3nD/whbUe9rmEQXLp8MB933Ij474gwwCPUpwv
9mj2PMnXoc7mbrS22XUSeTwxCTP9bcmUdp4jmIoWfhQm7X9w/Zgddg+JZ/YnIHOwsGsaTUgj7fIv
xqith7DoJC91WJ8Lce3CVJqb1XWeKIJ84F7YLXZN0oa7TktYgDdmQVxYkZo1c5noaDKH9Oq9cbm/
vOYRUM1cWcef20Wkyk5S/GFyyPJwG0fR1nRas3DqAf4cXxMiEKcff7PNa4M3RGTqH0pWR8p6EjGC
A7cwggOzAgEBMIGsMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0
Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIQP3J7
oHmTT6ADgJUNrPKVGjAJBgUrDgMCGgUAoIIB3zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0xNzEwMDkxNTQyMDZaMCMGCSqGSIb3DQEJBDEWBBSNwaRbKRMeCOTQ4irT
wkEHl0ALMjCBvQYJKwYBBAGCNxAEMYGvMIGsMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGlt
aXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3Vy
ZSBFbWFpbCBDQQIQP3J7oHmTT6ADgJUNrPKVGjCBvwYLKoZIhvcNAQkQAgsxga+ggawwgZcxCzAJ
BgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQx
GjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBB
dXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhA/cnugeZNPoAOAlQ2s8pUaMA0GCSqG
SIb3DQEBAQUABIIBABGtaOo6J9cscc5WzFjmziGrNFxp8JxSk/OzDGeNT7y8Frv8tbeCVHxyJ5fN
z09DhTwyWBarYMpwHLYXtiZUJPsvydr8r7MsT1FbSAMhtbiMA5aUxX+gOgEFjSsp3TyCqN1hjAOE
sIdcJED6E2YjNiiHyKTRBxwnRJoCUV4qqtvQFK6sULwBa3ruC5QaI7CqUuzQLGbx/sCWOaMCNEuC
Ek/Zhy6M0CKq8XHZ17Wdm2LtYOxWH0Ueu1Do9d5qyXgbdxZABbZaMeycMskjPmc6XBk/HZ5YoVZt
ZBO7N5batblFuWFWhwuX6gt8skz/N8q7wWw7KSSOhSxrj6ZticWg/5wAAAAAAAA=
--Apple-Mail=_DA158701-896C-4234-B59A-E2909EA4AB64--

